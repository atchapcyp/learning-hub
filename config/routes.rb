Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  

  get 'mycourse' => 'mycourses#mycourses',as: 'mycourse'
  resources :courses do
  	resources :assignments
  end
  root 'courses#index', as: 'home'
end
