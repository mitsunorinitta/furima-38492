class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name,      null: false
      t.text :item_description, null: false
      t.integer :item_category_id,   null: false
      t.integer :item_condition_id,  null: false
      t.integer :shipping_charge_id, null: false
      t.integer :prefecture_id,      null: false
      t.integer :days_ship_id,       null: false
      t.integer :item_price,         null: false
      t.references :user,            null: false, foreign_key: true
      t.timestamps
    end
  end
end
