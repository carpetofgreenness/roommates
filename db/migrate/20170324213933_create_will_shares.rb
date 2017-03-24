class CreateWillShares < ActiveRecord::Migration[5.0]
  def change
    create_table :will_shares do |t|
    	t.integer :user_id,
    	t.decimal :amount,
    	t.boolean :is_payer,

      t.timestamps
    end
  end
end
