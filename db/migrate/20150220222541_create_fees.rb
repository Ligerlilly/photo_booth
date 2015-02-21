class CreateFees < ActiveRecord::Migration
  def change
    create_table :fees do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
