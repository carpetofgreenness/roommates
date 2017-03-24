class CreateMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :memberships do |t|
    	t.decimal :balance
    	t.decimal :rent
    	t.boolean :rent_pays_to

      t.timestamps
    end
  end
end
