 Gymcc::Application.routes.draw do

  devise_for :deporte_usuario, controllers: { :sessions => "deporte_usuario/sessions" }
  
  devise_scope :deporte_usuario do
  	root :to => "deporte_usuario/sessions#new"
  end

  resources :citas_medicas, :only => [:index, :create] do
    collection do
      get :busqueda
      get :agendar
      get :citas
    end
  end

  resources :deporte_usuarios, :except => [:show] 

end