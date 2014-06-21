json.array!(@committees) do |committee|
  json.extract! committee, :id, :name, :type, :info_url
  json.url committee_url(committee, format: :json)
end
