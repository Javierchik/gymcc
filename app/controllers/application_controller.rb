class ApplicationController < ActionController::Base
  protect_from_forgery
  
  include AuthenticatedSystem
  before_filter { |c| Authorization.current_user = c.current_deporte_usuario }

  protected

  def permission_denied
    flash[:error] = "Usted no esta autorizado para entrar a esta pagina."
    redirect_to new_deporte_usuario_session_path and return
  end
end