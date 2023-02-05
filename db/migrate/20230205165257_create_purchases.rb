class CreatePurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :purchases do |t|
      t.float :amount
      t.boolean :use_bonuses

      t.timestamps
    end
  end
end
