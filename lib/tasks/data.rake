require 'csv_seeds'

namespace :data do
  desc "add Committees and Council Members to DB"
  task committees: [:environment] do
    CsvSeeds.import_council_members_and_committees!
	end

	desc "add Process Steps to DB"
  task process_steps: [:environment] do
    CsvSeeds.import_process_steps!
  end

  desc "add events and agenda items to DB"
  task agenda_items: [:environment] do
    CsvSeeds.import_agenda_items!
  end
end
