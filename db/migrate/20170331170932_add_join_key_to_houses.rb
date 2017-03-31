class AddJoinKeyToHouses < ActiveRecord::Migration[5.0]
  def change
  	add_column :houses, :join_key, :string
  end
end