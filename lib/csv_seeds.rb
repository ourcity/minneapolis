class CsvSeeds
  def self.import_council_members_and_committees!

    dir             = "data"
    committees_file = Rails.root.join(dir, "committees.csv")

    CSV.parse(File.read(committees_file), headers: true) do |row|
      committee          = Committee.where(id: row['id']).first_or_initialize
      committee.name     = row['name']
      committee.comm_type     = row['type']
      committee.info_url = row['info_url']
      committee.code = row['code']
      committee.save!

      puts "Updated info for #{committee.id}"
    end

    council_member_file = Rails.root.join(dir, "council_members.csv")

    CSV.parse(File.read(council_member_file), headers: true) do |row|
      council_member            = CouncilMember.where(id: row['id']).first_or_initialize
      council_member.ward       = row['ward']
      council_member.first_name = row['first_name']
      council_member.last_name  = row['last_name']
      council_member.ward_url  = row['ward_url']
      council_member.image_url  = row['image_url']
      council_member.email  = row['email']
      council_member.phone  = row['phone']
      council_member.neighborhoods  = row['neighborhoods']
      council_member.save!

      puts "Updated info for #{council_member.id}"
    end

    CSV.parse(File.read(Rails.root.join(dir, "committee_members.csv")), headers: true) do |row|
      committee_member            = CommitteeMember.where(id: row['id']).first_or_initialize
      committee_member.council_member_id = row['council_member_id']
      committee_member.committee_id = row['committee_id']
      committee_member.chair  = row['chair']
      committee_member.vice_chair  = row['vice_chair']
      committee_member.save!

      puts "Updated info for #{committee_member.id}"
    end
  end

  def self.import_process_steps!
    dir                = "data"
    process_steps_file = Rails.root.join(dir, "process_steps.csv")

    CSV.parse(File.read(process_steps_file), headers: true) do |row|
      process_steps             = ProcessStep.where(id: row['id']).first_or_initialize
      process_steps.sort_order  = row['sort_order']
      process_steps.short_name  = row['short_name']
      process_steps.description = row['description']
      process_steps.save!

      puts "Updated info for #{process_steps.id}"
    end
  end

  def self.import_agenda_items!
    dir                = "data"
    events_file = Rails.root.join(dir, "events.csv")

    CSV.parse(File.read(events_file), headers: true) do |row|
      event                 = Event.where(id: row['id']).first_or_initialize
      event.event_location  = row['event_location']
      event.time            = row['time']
      event.date            = Date.strptime(row['date'], "%m/%d/%Y").to_s(:db)
      event.agenda_url      = row['agenda_url']
      event.archive_status  = row['archive_status']
      event.committee_id    = Committee.where(name: row['committee']).first.id if Committee.where(name: row['committee']).first
      event.event_type      = row['event_type']
      event.save!

      puts "Updated info for #{event.id}"
    end

    agenda_items_file = Rails.root.join(dir, "agenda_items.csv")

    CSV.parse(File.read(agenda_items_file), headers: true) do |row|
      agenda_item             = AgendaItem.where(id: row['id']).first_or_initialize
      agenda_item.properties  = row.to_h.compact
      agenda_item.save!

      puts "Updated info for #{agenda_item.id}"
    end
  end

end
