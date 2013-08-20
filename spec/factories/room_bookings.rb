# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :room_booking do
    user nil
    reserved_at "2013-08-20 00:02:56"
    active false
  end
end
