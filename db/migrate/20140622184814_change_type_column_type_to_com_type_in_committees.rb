class ChangeTypeColumnTypeToComTypeInCommittees < ActiveRecord::Migration
  def change
  	rename_column :committees, :type, :comm_type
  end
end
