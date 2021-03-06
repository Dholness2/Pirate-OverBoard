Rails.application.routes.draw do

  resources :questions do
    resources :comments, except: [:index, :show]
    resources :answers, except: [:index, :show]
    member do
      post 'vote'
    end
  end
  resources :answers, except: [:index, :show] do
    member do
      put 'update_best_answer'
    end
    resources :comments, except: [:index, :show]
    member do
      post 'vote'
    end
  end

  resources :users, :sessions

  get 'welcome/index'
  get 'search', to:'welcome#search', as: :search
  get 'login', to: 'sessions#new', as: :login
  post 'login' => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get 'signup', to: 'users#new', as: :signup
  post 'signup' => 'users#create'
  root 'welcome#index'
end
