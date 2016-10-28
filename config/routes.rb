Rails.application.routes.draw do
  root 'application#index'

  get 'usage' => 'application#usage', :as => 'usage'

  resources :admins, only: [:index, :edit, :show, :update]
  get    'login'  => 'sessions#new'
  post   'login'  => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :students, only: [:index, :scan, :update]
  get   'students/' => 'students#index'
  get   'students/scan'  => 'students#scan'
  post  'students/scan'  => 'students#update'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
