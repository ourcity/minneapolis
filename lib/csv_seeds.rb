class CsvSeeds
  def self.import_council_members_and_committees!

    dir             = "data"
    committees_file = Rails.root.join(dir, "committees.csv")

    CSV.parse(File.read(committees_file), headers: true) do |row|
      committee          = Committee.where(id: row['id']).first_or_initialize
      committee.name     = row['name']
      committee.comm_type     = row['type']
      committee.info_url = row['info_url']
      committee.save!

      puts "Updated info for #{committee.id}"
    end

    council_member_file = Rails.root.join(dir, "council_members.csv")

    CSV.parse(File.read(council_member_file), headers: true) do |row|
      council_member            = CouncilMember.where(id: row['id']).first_or_initialize
      council_member.ward       = row['ward']
      council_member.first_name = row['first_name']
      council_member.last_name  = row['last_name']
      council_member.save!

      puts "Updated info for #{council_member.id}"
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

end
