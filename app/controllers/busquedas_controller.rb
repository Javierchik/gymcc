class BusquedasController < ApplicationController
  before_filter :authenticate_deporte_usuario!
  
  def index
    if params[:query_string].present?
      socios = Socio.arel_table
      @socios = Socio.where(:estado => "A").where(socios[:NumSocio].matches("%#{params[:query_string]}%").or(socios[:NumDocumento].matches("%#{params[:query_string]}%"))).paginate(:page => params[:page], :per_page => 10).order("NumSocio", "NombreSocio")
    end
  end

  def detalle
    @paciente = Socio.find(params[:id])
    @citas_medicas = @paciente.deporte_citas_medicas.order('dia_cita DESC, hora_cita DESC')
    @historias_clinicas = @paciente.deporte_historias_clinicas.order('created_at DESC')
  end

  def historia_clinica
    @paciente = Socio.find(params[:paciente_id])
    @historia_clinica = @paciente.deporte_historias_clinicas.find(params[:id])
  end

  def pdf
    @paciente = Socio.find(params[:paciente_id])
    @historia_clinica = @paciente.deporte_historias_clinicas.find(params[:id])
    
    html = render_to_string(:layout => 'pdf', :action => 'pdf')
    kit = PDFKit.new(html)
    send_data(kit.to_pdf, :filename => "historia_clinica.pdf", :type => 'application/pdf')
    return # to avoid double render call
  end

end