Rails.application.routes.draw do


  get 'devise/registrations'

  get 'devise/new'

  get 'devise/create'

  get 'devise/update'


  get 'registrations/new'

  get 'registrations/create'

  get 'registrations/update'

  get 'registrationscontroller/new'

  get 'registrationscontroller/create'

  get 'registrationscontroller/update'

  get 'records/:id' => 'records#show', :constraints  => {:id => /.+\.\w{3,4}/}

  resources :records do
    collection do
      get :authenticate
      get :callback
      get :whoami
      end
    end

  mount Attachinary::Engine => "/attachinary"



  resources :records do
    resources :orders, only: [:new, :create]
  end


  resources :orders, only: [:show, :index, :create, :destroy] do
  resources :payments, only: [:new, :create]
end

  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }



  namespace :admin do |variable|
    resources :orders, only: [:index]
    resources :records, only: [:index]
  end

  get 'pages/aboutus'

  # get 'orders/crete'

  # get 'orders/index'

  # get 'orders/show'

  # get 'orders/delete'

  # get 'records/index'

  # get 'records/show'

  # get 'records/new'

  # get 'records/create'

  # get 'records/edit'

  # get 'records/update'

  root to: 'records#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
