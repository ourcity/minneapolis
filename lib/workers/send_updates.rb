module Workers
  class SendUpdates
    def perform(*args)
      since_time = Time.zone.now
      add_items
      send_updates(since_time)
    end

    protected

    def add_items
      #add something to an issue
      issue = Issue.find_by_name('Honeybees')

      2.times do |i|
        item = issue.agenda_items.
          create!(
            title:       "item #{i}",
            description: 'Set a public hearing for October 16, 2014 to consider the subject matter of an ordinance amending Title 4, Chapter 74 of the Minneapolis Code of Ordinances relating to Animals and Fowl:  Miscellaneous Regulations, amending provisions related to the keeping of honeybees. (by Bender; Introduced 4/25/14)',
            action:      'Approved',
            committee: Committee.where(Committee.arel_table[:name].matches("%Health, Environment & Community Engagement%")).first,
            source_url:  'http://www.minneapolismn.gov/meetings/hece/WCMS1P-125183',
            acted_on: Time.parse('September 2, 2014 1:30 p.m.'),
            council_member: CouncilMember.find_by_last_name('Bender'))
        item.report_links.create!(
            title: 'Staff Report',
            url:   'http://www.minneapolismn.gov/www/groups/public/@clerk/documents/webcontent/wcms1p-125632.pdf')
      end

    end

    def send_updates(since_time)
      Subscription.subscribable_types.each do |notifiable_class|
        notifiable_class.all.find_each do |notifiable|
          notifiable.email_notify(since_time)
          notifiable.sms_notify(since_time)
        end
      end
    end
  end
end