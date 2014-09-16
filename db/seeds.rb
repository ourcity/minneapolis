require 'csv_seeds'
# clear the palette
Issue.delete_all
AgendaItem.delete_all
ReportLink.delete_all
Map.delete_all

CsvSeeds.import_council_members_and_committees!
CsvSeeds.import_process_steps!
CsvSeeds.import_agenda_items!

Map.create!({
  title: "Minneapolis Wards",
  name: "minneapolis-wards",
  description: "Minneapolis City Council Wards",
  store: {
    center: [44.96, -93.27],
    zoom: 11,
    layers: [{
      base: true,
      esri: true,
      source: 'NationalGeographic'
    }, {
      feature: true,
      esri: true,
      source: 'http://services.arcgis.com/afSMGVsC7QlRK1kZ/arcgis/rest/services/WARDS/FeatureServer/0'
    }]
  }
});


user = User.new(email: 'ben@thesubstars.com', first_name: 'Ben', last_name: 'O')
user.skip_confirmation!
user.save!
