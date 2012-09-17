 Gymcc::Application.routes.draw do

  devise_for :deporte_usuario, controllers: { :sessions => "deporte_usuario/sessions" }
  
  devise_scope :deporte_usuario do
    get "/login" => "deporte_usuario/sessions#new"
    root :to => "deporte_usuario/sessions#new"
  end

  resources :citas_medicas, :except => [:show] do
    member do
      get :agendar
    end

    collection do
      get :citas
    end
  end

  resources :historias_clinicas  do
    member do
      get :listado_historias
      get :elaborar
    end
  end

  resources :deporte_usuarios, :except => [:show] 

  resources :busquedas, :only => [:index] do
    member do
      get :detalle
    end
  end
  
  match "/busquedas/:paciente_id/historia_clinica/:id" => "busquedas#historia_clinica", :as => :paciente_historia_clinicas

  resources :agenda, :only => [:index]
  
end