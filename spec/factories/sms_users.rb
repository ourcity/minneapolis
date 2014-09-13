# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sms_user do
    sequence :phone do |n|
      "16125550000"
    end
  end
end
