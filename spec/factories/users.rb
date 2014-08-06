# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence :email do |n|
        "person#{n}@example.com"
    end
    first_name 'test'
    last_name 'user'
    street '123 anywhere'
        state 'MN'
    zip '55407'
    password 'hiiiiiiii'
  end
end
