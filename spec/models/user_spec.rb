require 'spec_helper'

describe User do

  it { should have_many(:room_bookings) }

  context "On missing attibutes" do
    before do
      @user = FactoryGirl.build(:user, user_name: nil)
    end
    it "be invalid without user_name" do
      expect(@user.valid?).to be_false
    end
  end
end
