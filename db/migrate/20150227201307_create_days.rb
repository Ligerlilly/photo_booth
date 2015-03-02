class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.string :event
      t.string :first_name
      t.string :last_name
      t.string :telephone
      t.string :email
      t.text :notification_params
      t.string :transaction_id
      t.datetime :purchased_at
      t.string :status

      t.timestamps
    end
  end
end
