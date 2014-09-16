class AgendaItem < ActiveRecord::Base
  belongs_to :issue
  belongs_to :process_step
  belongs_to :committee
  belongs_to :event
  has_many :report_links
  belongs_to :council_member
  has_many :report_links

  #validates :committee, presence: true

  scope :timeline, -> { order('acted_on DESC') }
  scope :between, -> (start_time, end_time) { where('created_at BETWEEN ? and ?', start_time, end_time) }
  scope :past, -> { where('acted_on < ?', Time.now) }
  scope :since, -> (start_time) { between(start_time, Time.now) }
  scope :upcoming, -> { where('acted_on >= ?', Time.now) }

  scope :for_user, -> (user) {
      joins =<<SQL
    LEFT JOIN "committees" ON "committees"."id" = "agenda_items"."committee_id"
    LEFT JOIN "subscriptions" ON "subscriptions"."subscribable_id" = "committees"."id" AND "subscriptions"."subscribable_type" = 'Committee'
    LEFT JOIN "issues" ON "issues"."id" = "agenda_items"."issue_id"
    LEFT JOIN "subscriptions" "subscriptions_issues" ON "subscriptions_issues"."subscribable_id" = "issues"."id" AND "subscriptions_issues"."subscribable_type" = 'Issue'
    LEFT JOIN "council_members" ON "council_members"."id" = "agenda_items"."council_member_id"
    LEFT JOIN "subscriptions" "subscriptions_council_members" ON "subscriptions_council_members"."subscribable_id" = "council_members"."id" AND "subscriptions_council_members"."subscribable_type" = 'CouncilMember'
SQL
      where = <<SQL
    subscriptions.user_id = ? OR subscriptions_issues.user_id = ? OR subscriptions_council_members.user_id = ?
SQL
      subscriptions = Arel::Table.new(:subscriptions)
      AgendaItem.joins(joins).where(
          subscriptions[:user_id].eq(user.id).
            or(subscriptions.alias('subscriptions_issues')[:user_id].eq(user.id)).
            or(subscriptions.alias('subscriptions_council_members')[:user_id].eq(user.id))
        )
    }
end
