json.array!(@committee_members) do |committee_member|
  json.extract! committee_member, :id, :committee_id, :council_member_id, :chair, :vice_chair
  json.url committee_member_url(committee_member, format: :json)
end
