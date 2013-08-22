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

  def verify_reservations(day,hour)
    rev = @reservations.select{|te| te.reserved_at.day == (@beginning_of_week + day.day).day && te.reserved_at.hour == hour}
    rev.empty? || (!rev.empty? && rev.first.active == false)
  end

end
