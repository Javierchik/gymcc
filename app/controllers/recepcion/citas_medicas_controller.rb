class Recepcion::CitasMedicasController < ApplicationController
  before_filter :authenticate_deporterecepcionistas!
  
  def index
    @citas_medicas = Deportecitasmedicas.all.order('FechaCitaMedica DESC')
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