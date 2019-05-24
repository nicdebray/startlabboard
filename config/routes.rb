Rails.application.routes.draw do
  get 'usercompanies/index'
  get 'usercompanies/show'
  get 'usercompanies/new'
  get 'usercompanies/create'
  get 'usercompanies/edit'
  get 'usercompanies/update'
  get 'usercompanies/destroy'
  get 'companies/index'
  get 'companies/show'
  get 'companies/new'
  get 'companies/create'
  get 'companies/edit'
  get 'companies/update'
  get 'companies/destroy'
  devise_for :users
  root to: 'pages#home'
  resources :job_offers do
    resources :job_applications
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
