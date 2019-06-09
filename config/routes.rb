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

  require "sidekiq/web"
  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
