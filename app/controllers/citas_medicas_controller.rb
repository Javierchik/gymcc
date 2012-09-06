class CitasMedicasController < ApplicationController
  before_filter :authenticate_deporte_usuario!
  filter_access_to :all, :context => :citas_medicas
  
  def index
    cita = DeporteCitasMedica.arel_table
    @citas_medicas = DeporteCitasMedica.where(cita[:dia_cita].gteq(Date.today)).paginate(:page => params[:page], :per_page => 10).order('dia_cita DESC, hora_cita DESC')
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

  def edit
    @cita_medica = DeporteCitasMedica.find(params[:id])
    @citas_medicas = @cita_medica.socio.deporte_citas_medicas.order('dia_cita DESC, hora_cita DESC')
  end

  def update
    @cita_medica = DeporteCitasMedica.find(params[:id])
    if @cita_medica.update_attributes(params[:deporte_citas_medica])
      flash[:notice] = "Se ha actualizado la cita con exito."
      redirect_to citas_medicas_path
    else
      @citas_medicas = @cita_medica.socio.deporte_citas_medicas.order('dia_cita DESC, hora_cita DESC')
      flash[:error] = "No se puede reagendar la cita. Verifique los campos requeridos *."
      render :editar
    end
  end

  def destroy
    @cita_medica = DeporteCitasMedica.find(params[:id])
    @cita_medica.destroy
    flash[:notice] = "Se ha eliminado la cita con exito."
    redirect_to citas_medicas_path
  end

end