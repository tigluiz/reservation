class CreateRoomBookings < ActiveRecord::Migration
  def change
    create_table :room_bookings do |t|
      t.references :user, index: true
      t.datetime :reserved_at
      t.boolean :active

      t.timestamps
    end
  end
end
