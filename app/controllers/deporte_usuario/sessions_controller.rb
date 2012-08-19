class DeporteUsuario::SessionsController < Devise::SessionsController
  layout 'bienvenida', :only => [:new]
end