module BookManager
  class Schedule
    def initialize(action,params,user)
      @beginning_of_week = Time.zone.now.beginning_of_week
      @reservations = RoomBooking.actual
      @action = action
      @params = params
      @user = user
    end

    def parse
      if ensure_valid_params(@params)
        res = @reservations.select{|te| te.reserved_at.month == @beginning_of_week.month && te.reserved_at.day == ((@beginning_of_week + (@params[:day].to_i).day).day) && te.reserved_at.hour == @params[:hour].to_i}
        return create_parse(res) if @action == "create"
        return destroy_parse(res) if @action == "destroy"
      else
        {status: 500}
      end
    end

    private
    def create_parse(reservations)
      if reservations.blank?
        reservation_date = @beginning_of_week + (@params[:day].to_i).day + @params[:hour].to_i.hour
        RoomBooking.create(reserved_at: reservation_date, active: true, user: @user)
      else
        reservations.first.update_attribute(:active, true )
      end
      {status: 200, user: @user.user_name}
    end

    def destroy_parse(reservations)
      if !reservations.blank?
        reservations.first.update_attribute(:active, false)
        {status: 200}
      else
        {status: 500}
      end
    end

    def ensure_valid_params(params)
      ReservationHelper::HOURS.include?(@params[:hour].to_i) && ReservationHelper::DAYS.include?(@params[:day].to_i)
    end
  end
end
