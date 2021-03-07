# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  root to: 'home#index'

  get 'about', to: 'home#about'
  get 'blog', to: 'home#blog'
  get 'contact', to: 'home#contact'
  get 'cv', to: 'home#cv'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
