class RoomBookingController < ApplicationController
  before_filter :authenticate_user!
  def index
    @hours = ReservationHelper::HOURS
    @days = ReservationHelper::DAYS
  end

  def create

  end
end
