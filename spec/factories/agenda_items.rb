FactoryGirl.define do
  factory :agenda_item do
    title 'Item Title'
    description 'Item Description'
    report_url 'http://foo.bar'
    action 'awesomed'
    source_url 'http://stuff.org'
    acted_on 1.day.ago
    # "process_step_id",
    # "committee_id",
    # "council_member_id",
    # "introducer_id"]
  end
end
