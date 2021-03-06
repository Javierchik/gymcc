class BusquedasController < ApplicationController
  before_filter :authenticate_deporte_usuario!
  filter_access_to :all, :context => :busquedas

  def index
    if params[:query_string].present?
      socios = Socio.arel_table
      @socios = Socio.where(:estado => "A").where(socios[:NumSocio].matches(params[:query_string]).or(socios[:NumDocumento].matches(params[:query_string]))).paginate(:page => params[:page], :per_page => 10).order("NumSocio", "NombreSocio")
    end
  end

  def detalle
    @paciente = Socio.find(params[:id])
    @citas_medicas = @paciente.deporte_citas_medicas.order('dia_cita DESC, hora_cita DESC')
    @historias_clinicas = @paciente.deporte_historias_clinicas.order('created_at DESC')
    respond_to do |format| 
      format.html
      format.pdf do
        render :pdf  => "Historial_#{@paciente.nombre_completo}_#{Time.now.to_i}",
               :template => "busquedas/detalle_pdf.html.erb",
               :layout   => "pdf.html.erb"
      end
  
    end
  end

end