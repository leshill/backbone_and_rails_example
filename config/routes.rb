BackboneAndRails::Application.routes.draw do
  resources :movies, :only => [:create, :destroy, :index, :show] do
    collection do
      get :populate
    end
  end

  root to: 'movies#index'
end
