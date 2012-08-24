class DeporteUsuario::SessionsController < Devise::SessionsController
  layout 'bienvenida', :only => [:new]

  def after_sign_in_path_for(resource)
    case resource.rol
      when 'R'
         citas_medicas_path 
      when 'M'
         historias_clinicas_path 
      when 'A'
         deporte_usuarios_path 
      end
  end
end