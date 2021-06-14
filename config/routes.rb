Rails.application.routes.draw do

  ## Devise

  devise_for :users, path:'', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: "register"}
  devise_for :users, path:'password', path_names: {new: "forget"}

  ## Portfolios

  resources :portfolios, except: [:show]
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  ## Pages

  get 'about-me', to: 'pages#about'
  get 'pages/about'
  get 'contact', to: 'pages#contact'

  ## blogs

  resources :blogs

  ## Root

  root to: 'pages#home'

end
