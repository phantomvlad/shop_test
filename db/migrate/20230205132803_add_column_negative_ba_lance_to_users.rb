class AddColumnNegativeBaLanceToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :negative_balance, :boolean, default:false
  end
end
