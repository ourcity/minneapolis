json.array!(@council_members) do |council_member|
  json.extract! council_member, :id, :ward, :first_name, :last_name, :committee_member_id
  json.url council_member_url(council_member, format: :json)
end
