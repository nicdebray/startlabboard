Rails.application.routes.draw do
  get 'job_applications/index'
  get 'job_applications/show'
  get 'job_applications/new'
  get 'job_applications/create'
  get 'job_applications/edit'
  get 'job_applications/update'
  get 'job_applications/destroy'
  root to: 'pages#home'
  resources :job_offers

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
