class AddReferencesShopToUserAndCard < ActiveRecord::Migration[7.0]
  def change
    add_reference :cards, :shop
  end
end
