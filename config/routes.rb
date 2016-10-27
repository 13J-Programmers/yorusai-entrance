Rails.application.routes.draw do
  root 'application#index'

  get 'usage' => 'application#usage', :as => 'usage'

  resources :admins, only: [:index, :edit, :show, :update]
  get    'login'  => 'sessions#new'
  post   'login'  => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get 'students/index' => 'students#index', :as => 'students_index'
  get 'students/scan' => 'students#scan', :as => 'scan'
  get 'students' => 'students#enter'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
