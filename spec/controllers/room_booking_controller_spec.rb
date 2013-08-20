require 'spec_helper'

describe RoomBookingController do
  context "Correct sign_in" do
    login_user
    describe "GET 'index'" do
      it "returns http success" do
        get 'index'
        expect(response).to be_success
      end
    end
  end
  context "Incorrect sign_in" do
    describe "GET 'index'" do
      it "returns http fail" do
        get 'index'
        expect(response).to_not be_success
      end
    end
  end
end
