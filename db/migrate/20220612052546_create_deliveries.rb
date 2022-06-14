class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|

      t.integer     :deliveryaddress_id  ,null: false
      t.string      :postcode            ,null: false
      t.string      :municipalitids      ,null: false
      t.string      :address             ,null: false
      t.string      :building         #建物名　任意の値
      t.string      :tel                 ,null: false
      t.references  :purchaserecord      ,null: false , foreign_key: true


      t.timestamps
    end
  end
end
