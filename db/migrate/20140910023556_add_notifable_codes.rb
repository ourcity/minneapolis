class AddNotifableCodes < ActiveRecord::Migration
  def change
    add_column :committees, :code, :string, limit: 20
    add_column :issues, :code, :string, limit: 20
    add_column :council_members, :code, :string, limit: 20
  end
end
