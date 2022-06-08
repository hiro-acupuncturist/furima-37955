class CreatePurchaserecords < ActiveRecord::Migration[6.0]
  def change
    create_table :purchaserecords do |t|

      t.timestamps
    end
  end
end
