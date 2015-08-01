Rails.application.routes.draw do
  devise_for :users
  resources :cabinets
  devise_scope :user do
    authenticated :user do
      root :to => 'cabinets#index'
    end
    unauthenticated :user do
      root :to => 'devise/registrations#new', as: :unauthenticated_root
    end
  end

  match 'cabinets/get/:id' => "cabinets#get", :as => "download" ,via: [:get]

end
