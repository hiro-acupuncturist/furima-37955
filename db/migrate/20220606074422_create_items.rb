class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name                ,null: false
      t.text    :instructions        ,null: false
      t.integer  :price               ,null: false
      t.integer  :deliveryaddress_id  ,null: false
      t.integer  :category_id         ,null: false
      t.integer  :quality_id          ,null: false
      t.integer  :deliverycharg_id    ,null: false
      t.integer  :deliveryday_id      ,null: false
      t.references  :user            ,null: false , foreign_key: true


      t.timestamps
    end
  end
end
