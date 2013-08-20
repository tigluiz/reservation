Reservation::Application.routes.draw do
  get "room_booking/index", as: "reservations"
  devise_for :users
  root 'home#index'
end
