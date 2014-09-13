class AddFieldsToCouncilMembers < ActiveRecord::Migration
  def change
    add_column :council_members, :ward_url, :string
    add_column :council_members, :image_url, :string
    add_column :council_members, :email, :string
    add_column :council_members, :phone, :string
    add_column :council_members, :neighborhoods, :text
  end
end
