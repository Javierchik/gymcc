class CitasMedicasController < ApplicationController
  before_filter :authenticate_deporte_usuario!
  
  def index
    @citas_medicas_hoy = DeporteCitasMedica.where(:dia_cita => Date.today).order('hora_cita ASC')
    @citas_medicas_manana = DeporteCitasMedica.where(:dia_cita => Date.tomorrow).order('hora_cita ASC')
  end

  def citas
    @citas_medicas = DeporteCitasMedica.paginate(:page => params[:page], :per_page => 30).order('dia_cita DESC, hora_cita DESC')
  end

  def busqueda
    @socios = [ ]
  	if params[:query_string].present?
      socios = Socio.arel_table
      @socios = Socio.where(:estado => "A").where(socios[:NumSocio].matches("%#{params[:query_string]}%").or(socios[:NumDocumento].matches("%#{params[:query_string]}%"))).order("NumSocio", "NombreSocio")
    end
  end

  def agendar
    @paciente = Socio.find(params[:id_unico_socio])
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