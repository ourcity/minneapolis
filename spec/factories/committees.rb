# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :committee do
    name 'Committee of Things'
    comm_type 'Standing Committee'
    info_url 'http://google.com'
    slug 'goo'
  end
end
