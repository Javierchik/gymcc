class CitasMedicasController < ApplicationController

  def agendar
    if params[:query_string].present?
      socios = Socio.arel_table
      @pacientes = Socio.where(:estado => "A").where(socios[:NumSocio].matches("%#{params[:query_string]}%").or(socios[:NumDocumento].matches("%#{params[:query_string]}%"))).order("NumSocio", "NombreSocio").paginate(:page => params[:page], :per_page => 20)
    else
      @pacientes = Socio.where(:estado => "A").order("NumSocio", "NombreSocio").paginate(:page => params[:page], :per_page => 20)
    end
  end
end