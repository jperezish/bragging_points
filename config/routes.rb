BraggingPoints::Application.routes.draw do
  resources :pools, only: [] do
    get :running_today, :on => :collection

    get :edit_status, :on => :member
  end
end
