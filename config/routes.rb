BraggingPoints::Application.routes.draw do
  resources :pools, only: [] do
    get :running_today, :on => :collection

    resource :status, controller: "pools/status", only: [:edit, :update]
  end
end
