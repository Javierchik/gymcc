class HistoriasClinicasController < ApplicationController
  before_filter :authenticate_deporte_usuario!
  filter_access_to :all, :context => :deporte_historias_clinicas

  def index
    @historias_clinicas = DeporteHistoriasClinica.paginate(:page => params[:page], :per_page => 10).order('created_at DESC')
  end

  def elaborar
    @paciente = Socio.find(params[:id])
    @historia_clinica = @paciente.deporte_historias_clinicas.build
  end

  def create
    @paciente = Socio.find(params[:id_unico_socio])
    @historia_clinica = @paciente.deporte_historias_clinicas.build params[:deporte_historias_clinica]
    
    if @historia_clinica.save
      flash[:notice] = "Se ha agendado creado la historia con exito."
      redirect_to historias_clinicas_path
    else
      flash[:error] = "No se puede guardar la historia. Verifique los campos requeridos *."
      render :elaborar
    end
  end

end