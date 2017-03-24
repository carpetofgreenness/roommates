class CreateHouses < ActiveRecord::Migration[5.0]
  def change
    create_table :houses do |t|
    	t.string :name,
    	t.text :description,
    	t.date :rent_start,

      t.timestamps
    end
  end
end
