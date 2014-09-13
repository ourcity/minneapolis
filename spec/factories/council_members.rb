# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :council_member do
    sequence :ward do |n|
      '0'
    end
    sequence :first_name do |n|
      "first_name_000"
    end
    sequence :last_name do |n|
      "last_name_000"
    end
  end
end