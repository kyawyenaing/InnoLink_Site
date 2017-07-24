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
    resources :boos
    resources :boostcampaings  
    resources :boosts  
# Don't touch them
        #will show the companies of current_user
    get "dashboard/:user_id" => "dashboard#index"
        #will show the jobs of the current_user's company
    get "dashboard/companies/:id" => "dashboard#show"
        #will perform the adding a new job function
    post "jobs_add" => "jobs#jobs_add"
        #will update the selected job
    post "jobs/edit/:id" => "jobs#update"
        #will delete the selected job
    post "jobs/delete/:id" => "jobs#destroy"
        #will perform the adding a new company function
    post "companies_add" => "companies#companies_add"
        #will update the selected company
    post "companies/edit/:id" => "companies#update"
    #
    post "boost_job" => "boostcampaings#boost_job"
    #
    post "boosted_job/edit/:id" => "boosts#update"
#End don't touch them
    devise_scope :user do
      post 'registrations' => 'registrations#create', :as => 'register'
      post 'sessions' => 'sessions#create', :as => 'login'
      delete 'sessions' => 'sessions#destroy', :as => 'logout'
    end
  end

  resources :jobs do
    resources :boostcampaings do
    end
    resources :boosts do
    end
  end
  resources :companies do
  end
  resources :home_companies do 
  end
  resources :dashboard do
  end
  resources :home do 
  end
  resources :boostcampaings do
  end
  resources :boosts do
  end

  namespace :admin do 

    root :to => "panel#index"
    resources :companies do 
    end
    resources :jobs do       
    end
    resources :boostcampaings do
    end
    resources :boosts do
    end
  
  end


end
