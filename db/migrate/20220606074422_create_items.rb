class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name                ,null: false
      t.text    :instructions        ,null: false
      t.string  :price               ,null: false
      t.string  :deliveryaddress_id  ,null: false
      t.string  :category_id         ,null: false
      t.string  :quality_id          ,null: false
      t.string  :deliverycharg_id    ,null: false
      t.string  :deliveryday_id      ,null: false
      t.references  :user            ,null: false , foreign_key: true


      t.timestamps
    end
  end
end
