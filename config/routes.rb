Gymcc::Application.routes.draw do

  resources :citas_medicas, :only => [] do
    collection do
      get :agendar
    end
  end

  root :to => 'citas_medicas#agendar'
end