namespace :data do 
  desc "add Committees and Council Members to DB"
  task comittees: [:environment] do   

    dir = "data"
    committees_file = File.join(dir, "committees.csv")

    CSV.parse(open(committees_file).read, headers: true) do |row|
      committee = Committee.where(id: row['id']).first_or_initialize
      committee.name = row['name']
      committee.type = row['type']
      committee.info_url = row['info_url']
      committee.save!
      
      puts "Updated info for #{committee.id}"
    end

    council_member_file = File.join(dir, "council_members.csv")

    CSV.parse(open(key_people_file).read, headers: true) do |row|
      council_member = CouncilMember.where(id: row['id']).first_or_initialize
      council_member.ward = row['ward']
      council_member.first_name = row['first_name']
      council_member.last_name = row['last_name']
	    council_member.save!

			puts "Updated info for #{council_member.id}"
		end
	end

	desc "add Process Steps to DB"
  task process_steps: [:environment] do   

    dir = "data"
    process_steps_file = File.join(dir, "process_steps.csv")

    CSV.parse(open(process_steps_file).read, headers: true) do |row|
      process_steps = ProcessStep.where(id: row['id']).first_or_initialize
      process_steps.sort_order = row['sort_order']
      process_steps.short_name = row['short_name']
      process_steps.description = row['description']
      process_steps.save!
      
      puts "Updated info for #{process_steps.id}"
    end
end
