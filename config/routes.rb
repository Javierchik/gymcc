Gymcc::Application.routes.draw do

  devise_for :deporterecepcionistas

  namespace "recepcion" do
	  resources :citas_medicas, :only => [:index] do
	    collection do
	      get :busqueda
	    end
	  end
  end

  root :to => 'principal#bienvenida'
end