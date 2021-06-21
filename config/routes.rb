Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: 'homes#top'

  resources :books, omly:[:new, :create, :index, :show, :destroy]

end
