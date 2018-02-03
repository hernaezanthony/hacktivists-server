Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  namespace :api, :defaults => { :format => :json } do

 	resources :user

    post '/user/register' => 'user#register', :as => 'register'
    post '/user/login' => 'user#login', :as => 'login'
    post '/user/logout' => 'user#logout', :as => 'logout'
    get  '/user/show' => 'user#show', :as => 'show_all_user'

    resources :petition

    post '/petition/create_petition' => 'petition#create_petition', :as => 'create_petition'
    post '/petition/update_enrollment' => 'petition#update_enrollment', :as => 'update_enrollment'
    get  '/petition/show' => 'petition#show', :as => 'show_all_petition'
    post '/petition/my_enrolled' => 'petition#my_enrolled', :as => 'my_enrolled'
    post '/petition/search' => 'petition#search', :as => 'search'
    post '/petition/updateID_freelancer' => 'petition#updateID_freelancer', :as => 'updateID_freelancer'
    post '/petition/updateTutor' => 'petition#updateTutor', :as => 'updateTutor'
    post '/petition/posted' => 'petition#posted', :as => 'posted'
    post '/petition/cancel_enrolled' => 'petition#cancel_enrolled', :as => 'cancel_enrolled'

  end

end
