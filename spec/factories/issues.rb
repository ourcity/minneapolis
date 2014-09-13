# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :issue do
    name 'Internets'
    slug 'internets'
    summary 'rad'
    sequence :code do |n|
      "ISSUE_#{n}"
    end
  end
end
