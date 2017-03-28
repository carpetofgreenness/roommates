class CreateRecurrings < ActiveRecord::Migration[5.0]
  def change
    create_table :recurrings do |t|
    	t.string :name
    	t.date :starts_on
    	t.decimal :amount
    	t.string :frequency
    	t.integer :house_id

      t.timestamps
    end
  end
end
