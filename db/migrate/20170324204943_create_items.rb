class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
    	t.string :name
    	t.decimal :amount
    	t.text :description
    	t.boolean :shared
    	t.date :purchased
    	t.integer :house_id

      t.timestamps
    end
  end
end
