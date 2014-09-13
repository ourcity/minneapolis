class AddDigestToSubscription < ActiveRecord::Migration
  def change
    add_column :subscriptions, :digest, :boolean
  end
end
