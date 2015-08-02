Rails.application.routes.draw do
  devise_for :users
  resources :cabinets
  resources :folders

  root to: "homes#index"
  match "browse/:folder_id" => "homes#browse", :as => "browse" ,via: [:get]
  match 'cabinets/get/:id' => "cabinets#get", :as => "download" ,via: [:get]
  get "browse/:folder_id/new_folder" => "folders#new", :as => "new_sub_folder"
  get "browse/:folder_id/new_file" => "cabinets#new", :as => "new_sub_file"
  match "browse/:folder_id/rename" => "folders#update", :as => "rename_folder" ,via: [:get,:put]
end
