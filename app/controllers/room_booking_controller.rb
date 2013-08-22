class RoomBookingController < ApplicationController
  before_filter :authenticate_user!
  def index
    @hours = ReservationHelper::HOURS
    @days = ReservationHelper::DAYS
    @current_week = Time.zone.now.beginning_of_week..Time.zone.now.end_of_week
    @reservations = RoomBooking.actual
    @beginning_of_week = Time.zone.now.beginning_of_week
  end

  def create
    render json: BookManager::Schedule.new("create",params,current_user).parse
  end

  def destroy
    render json: BookManager::Schedule.new("destroy",params,current_user).parse
  end
end
