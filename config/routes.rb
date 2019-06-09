Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  root to: 'pages#home'

  resources :companies do
    resources :job_offers do
      resources :job_applications, only: [:index, :show]
    end
    resources :usercompanies
  end

  resources :job_offers, only: [:index, :show] do
    member do
      get 'toggle_published', to: 'job_offers#toggle_published'
    end
    collection do
      get 'my_job_offers', to: 'job_offers#my_job_offers'
    end
    resources :job_applications, only: [:new, :create]
  end

  resources :job_applications

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


# as a user I can see all the job offers
# as a user I can apply all the job offers ie. new/create
# as a user I can see all my applications, edit and delete them

# as a user I can see create update a company
# as a user I can manage usercompany assignment
# as a user I can see create update destroy a job offer for company
# as a user I can see job applications for a job offer for company
