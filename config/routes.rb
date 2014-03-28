BraggingPoints::Application.routes.draw do
  resources :pools, only: [] do
    get :running_today, :on => :collection
  end
end
