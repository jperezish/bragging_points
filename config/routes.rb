BraggingPoints::Application.routes.draw do
  root "pools#index"
  resources :pools
end
