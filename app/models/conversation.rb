class Conversation < ActiveRecord::Base
  belongs_to :conversable, polymorphic: true
end
