Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  

  get 'mycourse' => 'mycourses#mycourses',as: 'mycourse'
  resources :courses
  root 'courses#index', as: 'home'
end
