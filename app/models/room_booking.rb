class RoomBooking < ActiveRecord::Base
  belongs_to :user
  validates :user, presence: true
  scope :active, lambda {where(active: true)}
  scope :actual, lambda {where(reserved_at: actual_week)}

  private
    def self.actual_week
      Time.zone.now.beginning_of_week..Time.zone.now.end_of_week
    end
end
