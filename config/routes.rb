BraggingPoints::Application.routes.draw do
  resources :pools, only: [] do
    get :running_today, :on => :collection

    put :update_status, :on => :member

    resource :status, controller: "pools/status", only: [:edit]
  end
end
