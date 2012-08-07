Gymcc::Application.routes.draw do

  resources :citas_medicas, :only => [:agendar]
  
  root :to => 'citas_medicas#agendar'
end