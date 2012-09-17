class HistoriasClinicasController < ApplicationController
  before_filter :authenticate_deporte_usuario!
  filter_access_to :all, :context => :deporte_historias_clinicas

  def index
    @historias_clinicas = DeporteHistoriasClinica.paginate(:page => params[:page], :per_page => 10).order('created_at DESC')
  end

  def show
    @historia_clinica = DeporteHistoriasClinica.find(params[:id])
    @paciente = @historia_clinica.socio
    respond_to do |format| 
      format.html
      format.pdf do
        render :pdf  => "Historia_clinica_#{@paciente.nombre_completo}_#{Time.now.to_i}",
               :template => "historias_clinicas/show_pdf.html.erb",
               :layout   => "pdf.html.erb"
      end
  
    end
  end

  def elaborar
    @paciente = Socio.find(params[:id])
    @historia_clinica = @paciente.deporte_historias_clinicas.build
  end

  def create
    @paciente = Socio.find(params[:id_unico_socio])
    @historia_clinica = @paciente.deporte_historias_clinicas.build params[:deporte_historias_clinica]
    
    if @historia_clinica.save
      flash[:notice] = "Se ha creado la historia con exito."
      redirect_to historias_clinicas_path
    else
      flash[:error] = "No se puede guardar la historia. Verifique los campos requeridos *."
      render :elaborar
    end
  end

  def edit
    @historia_clinica = DeporteHistoriasClinica.find(params[:id])
    @paciente = @historia_clinica.socio
  end

  def update
    @historia_clinica = DeporteHistoriasClinica.find(params[:id])
    if @historia_clinica.update_attributes(params[:deporte_historias_clinica])
      flash[:notice] = "Se ha actualizado la historia con exito."
      redirect_to historias_clinicas_path
    else
      flash[:error] = "No se puede guardar la historia. Verifique los campos requeridos *."
      render :edit
    end
  end

  def destroy
    @historia_clinica = DeporteHistoriasClinica.find(params[:id])
    @historia_clinica.destroy
    flash[:notice] = "Se ha eliminado la historia con exito."
    redirect_to historias_clinicas_path
  end

end