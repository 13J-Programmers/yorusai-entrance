Rails.application.routes.draw do
  root 'application#index'

  get 'usage' => 'application#usage', :as => 'usage'

  resources :admins, only: [:index, :edit, :show, :update]
  get    'login'    => 'sessions#new'
  post   'login'    => 'sessions#create'
  delete 'logout'   => 'sessions#destroy'
  post   'settings' => 'admins#general_settings', as: :general_settings

  resources :students, only: [:index, :new, :create, :destroy]
  get    'students/scan'      => 'students#scan'
  post   'students/scan'      => 'students#update'
  post   'students/create_from_csv'  => 'students#create_from_csv'
  delete 'students'                  => 'students#destroy_all'
  post   'students/reset_elected'    => 'students#reset_elected'
  post   'students/reset_attended'   => 'students#reset_attended'
  post   'students/attend_at_random' => 'students#attend_at_random'

  resources :classrooms, only: [:index, :create, :destroy]
  post   'classrooms/create_from_csv' => 'classrooms#create_from_csv'
  delete 'classrooms' => 'classrooms#destroy_all'
  post   'classrooms/reset_elected' => 'classrooms#reset_elected'

  get    'lottery/'          => 'lottery#lottery'
  get    'lottery/student'   => 'lottery#student'
  get    'lottery/classroom' => 'lottery#classroom'
  get    'lottery/result'    => 'lottery#result'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
