 Gymcc::Application.routes.draw do

  devise_for :deporte_usuario, controllers: { :registrations => "deporte_usuario/registrations", :sessions => "deporte_usuario/sessions"}
  
  resources :citas_medicas, :only => [:index] do
    collection do
      get :busqueda
      get :agendar
    end
  end
 
  root :to => 'citas_medicas#index'
end