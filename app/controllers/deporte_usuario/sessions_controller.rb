class DeporteUsuario::SessionsController < Devise::SessionsController
  layout 'bienvenida', :only => [:new]

  def after_sign_in_path
    citas_medicas_path
  end
end