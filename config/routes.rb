 Gymcc::Application.routes.draw do

  devise_for :deporte_usuario, controllers: { :sessions => "deporte_usuario/sessions" }
  
  devise_scope :deporte_usuario do
    get "/login" => "deporte_usuario/sessions#new"
    root :to => "deporte_usuario/sessions#new"
  end

  resources :citas_medicas, :only => [:index, :create] do
    collection do
      get :busqueda
      get :agendar
      get :citas
    end
  end

  resources :historias_clinicas do
  end

  resources :deporte_usuarios, :except => [:show] 
  
end