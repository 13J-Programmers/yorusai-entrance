Rails.application.routes.draw do
  resources :admins, only: [:index, :edit, :show, :update]

  get 'students/index' => 'students#index', :as => 'students_index'

  get 'students/scan' => 'students#scan'

  get 'students' => 'students#enter'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
