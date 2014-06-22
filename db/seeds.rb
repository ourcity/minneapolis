# issue 1: open data
open_data = Issue.create!(
  name: 'Open Data',
  summary: 'Minneapolis Open Data initatives'
)

open_data_1 = open_data.agenda_items.create!({
  title: 'Open Data Policy Working Group',
  description: 'Progress report on the Open Data council directive including framework, approach to policy development, key objectives, and timeline.',
  action: 'Received and Filed',
  source: 'Committee of the Whole Agenda',
  source_url: 'http://www.minneapolismn.gov/meetings/cow/WCMS1P-122277',
  acted_on: Time.parse('March 26, 2014 10:00 AM')
})

open_data_1.report_links.create!(title: 'Open Data RCA',
                                 url: 'http://www.minneapolismn.gov/www/groups/public/@clerk/documents/webcontent/wcms1p-122304.pdf')

# issue 2: honeybees

honeybees = Issue.create!(
  name: 'Honeybees',
  summary: 'Activity involving keeping of honeybees in Minneapolis'
)

honeybees_1 = honeybees.agenda_items.create!({
  title: 'Keeping of Honeybees Ordinance',
  description: 'Set a public hearing for June 16, 2014 to consider the subject matter of an ordinance amending Title 4, Chapter 74 of the Minneapolis Code of Ordinances relating to Animals and Fowl:  Miscellaneous Regulations, amending provisions related to the keeping of honeybees. (by Bender; Introduced 4/25/14)',
  action: 'Approved',
  source: 'Health, Environment & Community Engagement Committee Agenda',
  source_url: 'http://www.minneapolismn.gov/meetings/hece/WCMS1P-125183',
  acted_on: Time.parse('June 2, 2014 1:30 p.m.')
})

honeybees_1.report_links.create!(title: 'Staff Report:',
                                 url: 'http://www.minneapolismn.gov/www/groups/public/@clerk/documents/webcontent/wcms1p-125632.pdf')

honeybees_2 = honeybees.agenda_items.create!({
  title: 'Honeybees',
  description: ' Consider ordinance amending Title 4, Chapter 74 of the Minneapolis Code of Ordinances relating to Animals and Fowl: Miscellaneous Regulations, amending provisions regulating the keeping of honeybees on rooftops (by Goodman).',
  action: 'Approved, with additional amendments to Sections 74.80(d) and 74.80(g)(6) as follows:',
  source: 'Health, Environment & Community Engagement Committee Agenda',
  source_url: 'http://www.minneapolismn.gov/meetings/psch/WCMS1P-102592',
  acted_on: Time.parse('April 3, 2013 1:30 p.m.')})

honeybees_2.report_links.create!(title: 'Honeybees RCA',
                                 url: 'http://www.minneapolismn.gov/www/groups/public/@clerk/documents/webcontent/wcms1p-105484.pdf')
honeybees_2.report_links.create!(title: 'Honeybees ORDN',
                                 url: 'http://www.minneapolismn.gov/www/groups/public/@clerk/documents/webcontent/wcms1p-105485.pdf')

honeybees_3 = honeybees.agenda_items.create!({
  title: 'Keeping of Honeybees Ordinance',
  description: 'Subject matter of an ordinance amending Title 4, Chapter 74 of the Minneapolis Code of Ordinances relating to Animals and Fowl:  Miscellaneous Regulations, amending provisions related to the keeping of honeybees. (by Bender)',
  action: 'Refer to Animal Care & Control staff',
  source: 'Health, Environment & Community Engagement Committee Agenda',
  source_url: 'http://www.minneapolismn.gov/meetings/hece/WCMS1P-123584',
  acted_on: Time.parse('April 3, 2013 1:30 p.m.')})

Map.create({
  title: "Mapbox Example",
  name: "mapbox-example",
  description: "Sample Mapbox map from the leaflet docs",
  store: {
    center: [44.96, -93.27],
    zoom: 13,
    layers: [{
      base: true,
      source: 'http://{s}.tiles.mapbox.com/v3/{id}/{z}/{x}/{y}.png',
      params: {
        attribution: 'Mapbox',
        maxZoom: 16,
        id: 'examples.map-i86knfo3'
      }
    }]
  }
})
