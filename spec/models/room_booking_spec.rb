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

  describe "#scopes" do
    context "When inactive" do
      before do
        @room_booking = FactoryGirl.create(:room_booking, :room_with_user, active: false)
      end
      it "not appear" do
        reservations = described_class.active
        expect(reservations.to_a).to eql []
      end
    end
    context "When are out of date" do
      before do
        @room_booking = FactoryGirl.create(:room_booking, :room_with_user, reserved_at: "2013-08-16 04:58:52")
      end
      it "not appear" do
        Timecop.freeze(2013,8,20,0,0,0) do
          reservations = described_class.actual
          expect(reservations.to_a).to eql []
        end
      end
    end
    context "When active but out of date" do
      before do
        @room_booking = FactoryGirl.create(:room_booking, :room_with_user, reserved_at: "2013-08-16 04:58:52", active: true)
      end
      it "not appear" do
        Timecop.freeze(2013,8,20,0,0,0) do
          reservations = described_class.active.actual
          expect(reservations.to_a).to eql []
        end
      end
    end
    context "When on correct date but inactive" do
      before do
        @room_booking = FactoryGirl.create(:room_booking, :room_with_user, reserved_at: "2013-08-19 04:58:52", active: false)
      end
      it "not appear" do
        Timecop.freeze(2013,8,20,0,0,0) do
          reservations = described_class.active.actual
          expect(reservations.to_a).to eql []
        end
      end
    end
    context "When active and correct week" do
      before do
        @room_booking = FactoryGirl.create(:room_booking, :room_with_user, reserved_at: "2013-08-19 04:58:52", active: true)
      end
      it "not appear" do
        Timecop.freeze(2013,8,20,0,0,0) do
          reservations = described_class.active.actual
          expect(reservations.to_a).to eql [@room_booking]
        end
      end
    end
  end
end
