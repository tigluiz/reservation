require 'spec_helper'

describe RoomBooking do
  it { should belong_to(:user) }
  describe "#initialize" do
    context "without user" do
      it "should fail" do
        @user = FactoryGirl.build(:room_booking)
        expect(@user).to_not be_valid
      end
    end
  end
end
