Reservation::Application.routes.draw do
  get "reservation/index"
  devise_for :users
  root 'home#index'
end
