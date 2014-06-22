json.array!(@committees) do |committee|
  json.extract! committee, :id, :name, :comm_type, :info_url
  json.url committee_url(committee, format: :json)
end
