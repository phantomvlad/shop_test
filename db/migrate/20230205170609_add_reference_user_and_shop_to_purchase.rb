class AddReferenceUserAndShopToPurchase < ActiveRecord::Migration[7.0]
  def change
    add_reference :purchases, :user
    add_reference :purchases, :shop
  end
end
