# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event_attendee do
    voting_setting "MyString"
    meeting_status "MyString"
    order_of_appearance "MyString"
    council_member nil
    event nil
  end
end
