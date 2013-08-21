Reservation::Application.routes.draw do
  get "room_booking/index", as: "reservations"
  post "room_booking/create"
  post "room_booking/destroy"
  devise_for :users
  root 'home#index'
end
