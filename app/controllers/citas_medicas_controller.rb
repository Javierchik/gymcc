class CitasMedicasController < ApplicationController
  before_filter :authenticate_deporte_usuario!
  
  def index
    @citas_medicas = DeporteCitasMedica.all.order('FechaCitaMedica DESC')
  end

  def busqueda
    @pacientes = [ ]
  	if params[:query_string].present?
      socios = Socio.arel_table
      @pacientes = Socio.where(:estado => "A").where(socios[:NumSocio].matches("%#{params[:query_string]}%").or(socios[:NumDocumento].matches("%#{params[:query_string]}%"))).order("NumSocio", "NombreSocio").paginate(:page => params[:page], :per_page => 20)
    end
  end
  
  def agendar
    
  end

end