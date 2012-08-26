class AgendaController < ApplicationController
  before_filter :authenticate_deporte_usuario!

  def index
    @citas_medicas_hoy = DeporteCitasMedica.where(:dia_cita => Date.today).order('hora_cita ASC')
    @citas_medicas_manana = DeporteCitasMedica.where(:dia_cita => Date.tomorrow).order('hora_cita ASC')
  end
end