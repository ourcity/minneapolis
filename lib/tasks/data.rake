namespace :data do 
  desc "add Grants to DB"
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
end
