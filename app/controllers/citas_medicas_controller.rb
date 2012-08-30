class CitasMedicasController < ApplicationController
  before_filter :authenticate_deporte_usuario!
  filter_access_to :all, :context => :citas_medicas
  
  def index
    @citas_medicas = DeporteCitasMedica.paginate(:page => params[:page], :per_page => 10).order('dia_cita DESC, hora_cita DESC')
  end

  def agendar
    @paciente = Socio.find(params[:id])
    @citas_medicas = @paciente.deporte_citas_medicas.order('dia_cita DESC, hora_cita DESC')
    @cita_medica = DeporteCitasMedica.new
    @cita_medica.socio_id = @paciente.id
  end

  def create
    @paciente = Socio.find(params[:id_unico_socio])
    @cita_medica = @paciente.deporte_citas_medicas.build params[:deporte_citas_medica]

    if @cita_medica.save
      flash[:notice] = "Se ha agendado la cita con exito."
      redirect_to citas_medicas_path
    else
      @citas_medicas = @paciente.deporte_citas_medicas.order('dia_cita DESC, hora_cita DESC')
      flash[:error] = "No se puede agendar la cita. Verifique los campos requeridos *."
      render :agendar
    end
  end

end