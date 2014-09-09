# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    description "MyString"
    date "2014-09-07 18:27:43"
    agenda_url "MyString"
    archive_status "MyString"
    committee nil
    event_type "MyString"
  end
end
