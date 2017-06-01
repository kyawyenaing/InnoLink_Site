Rails.application.routes.draw do
  devise_for :users

  root :to =>'home#index'

  get "dashboard" => "dashboard#index"

  namespace :api, defaults: {format: :json} do
    resources :categories
    resources :cities
    resources :salaries
    resources :companies
    resources :jobs     
# Don't touch them
        #will show the companies of current_user
    get "dashboard/:user_id" => "dashboard#index"
        #will show the jobs of the current_user's company
    get "dashboard/companies/:id" => "dashboard#show"
        #will perform the adding a new job function
    post "jobs_add" => "jobs#jobs_add"
        #will update the selected job
    post "jobs/edit/:id" => "jobs#update"
        #will perform the adding a new company function
    post "companies_add" => "companies#companies_add"
        #will update the selected company
    post "companies/edit/:id" => "companies#update"
#End don't touch them
    devise_scope :user do
      post 'registrations' => 'registrations#create', :as => 'register'
      post 'sessions' => 'sessions#create', :as => 'login'
      delete 'sessions' => 'sessions#destroy', :as => 'logout'
    end
  end

  resources :jobs do
  end

  resources :companies do
  end

  resources :home_companies do 
  end

  resources :dashboard do
  end

  resources :home do 
  end

  namespace :admin do 

    resources :companies do 
    end
    resources :jobs do 
    end
    resources :panel do 
    end
  
  end


end
