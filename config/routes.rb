Reservation::Application.routes.draw do
  get "reservation/index", as: "reservations"
  devise_for :users
  root 'home#index'
end
