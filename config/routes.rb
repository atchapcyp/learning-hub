Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get 'mycourses'=> 'mycourses#index'
  
  resources :courses do
    resources :assignments
  end
  post 'subscribe_course'=> 'courses#subscribe'
  root 'courses#index', as: 'home'
end
