class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
    	t.string :name,
    	t.decimal :amount,
    	t.text :description,
    	t.boolean :shared,
    	t.date :purchased,

      t.timestamps
    end
  end
end
