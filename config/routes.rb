Rails.application.routes.draw do
  get 'students/index' => 'students#index'

  get 'students/scan' => 'students#scan'

  get 'students' => 'students#enter'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
