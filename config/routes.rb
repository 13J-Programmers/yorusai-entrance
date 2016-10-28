Rails.application.routes.draw do
  root 'application#index'

  get 'usage' => 'application#usage', :as => 'usage'

  resources :admins, only: [:index, :edit, :show, :update]
  get    'login'  => 'sessions#new'
  post   'login'  => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get   'students/'      => 'students#index'
  get   'students/scan'  => 'students#scan'
  post  'students/scan'  => 'students#update'
  get   'students/new'   => 'students#new'
  get   'lottery/'       => 'students#lottery'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
