Rails.application.routes.draw do
  root 'application#index'

  get 'usage' => 'application#usage', :as => 'usage'

  resources :admins, only: [:index, :edit, :show, :update]
  get    'login'    => 'sessions#new'
  post   'login'    => 'sessions#create'
  delete 'logout'   => 'sessions#destroy'
  post   'settings' => 'admins#general_settings', as: :general_settings

  resources :students, only: [:index, :new, :create]
  get   'students/scan'      => 'students#scan'
  post  'students/scan'      => 'students#update'
  get   'lottery/'           => 'students#lottery'
  get   'lottery/result'     => 'students#result'
  get   'lottery/classroom'  => 'students#classroom'
  get   'lottery/numbers'    => 'students#numbers'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
