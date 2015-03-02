class AddColumnDateOfEventToDays < ActiveRecord::Migration
  def change
    add_column :days, :date_of_event, :date, unique: true 
  end
end
