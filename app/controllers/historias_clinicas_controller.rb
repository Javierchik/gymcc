class HistoriasClinicasController < ApplicationController
  before_filter :authenticate_deporte_usuario!
  filter_access_to :all, :context => :deporte_historias_clinicas

  def index
    @citas_medicas_hoy = DeporteCitasMedica.where(:dia_cita => Date.today).order('hora_cita ASC')
    @citas_medicas_manana = DeporteCitasMedica.where(:dia_cita => Date.tomorrow).order('hora_cita ASC')
  end

  def listado_historias
  end

  def elaborar
    @paciente = Socio.find(params[:id])
    @historias_clinicas = @paciente.deporte_historias_clinicas.order('created_at DESC')
    @historia_clinica = DeporteHistoriasClinica.new
    @historia_clinica.socio_id = @paciente.id
  end

  def create
  end

end