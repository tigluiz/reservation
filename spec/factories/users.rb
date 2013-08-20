# -*- encoding : utf-8 -*-
FactoryGirl.define do
  factory :user do
    user_name "Almeida"
    password "123456"
    password_confirmation "123456"
    sequence :email do |n|
      "person#{n}@example.com"
    end
  end
end
