module ReservationHelper
  HOURS = (6..23).to_a
  DAYS = (0..4).to_a

  def link_to_room_booking(day,hour)
    if verify_reservations(day,hour)
      link_to "Disponível", room_booking_create_path, data: {hour: hour, day: day}, class: "send_data"
    else
      link_to_if check_manager_avaliable(day,hour) ,"Cancelar", room_booking_destroy_path, data: {hour: hour, day: day}, class: "send_data"
    end
  end

  def reservation_of(day,hour)
    rev = pick_up_reservation(day,hour)
    result = !rev.empty? && rev.first.try(:user) == current_user && rev.first.try(:active) == true ? "Reservado por #{current_user.user_name}" : ""
    content_tag(:span, result)
  end

  def print_hour(hour)
    "#{hour}:00"
  end

  private

  def check_manager_avaliable(day,hour)
    pick_up_reservation(day,hour).first.try(:user) == current_user
  end

  def verify_reservations(day,hour)
    rev = pick_up_reservation(day,hour)
    rev.empty? || (!rev.empty? && rev.first.active == false)
  end

  def pick_up_reservation(day,hour)
    @reservations.select{|te| te.reserved_at.day == (@beginning_of_week + day.day).day && te.reserved_at.hour == hour}
  end

end
