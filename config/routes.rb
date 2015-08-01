Rails.application.routes.draw do
  devise_for :users
  resources :cabinets
  resources :folders

  root to: "homes#index"

  match 'cabinets/get/:id' => "cabinets#get", :as => "download" ,via: [:get]

end
