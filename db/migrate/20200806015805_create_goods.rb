class CreateGoods < ActiveRecord::Migration[5.0]
  def change
    create_table :goods do |t|
      t.string     :name, null: false
      t.text       :introduction, null: false
      t.references :category, null: false
      t.references :prefecture, null:false
      t.references :charge, null: false
      t.references :shipping_method, null: false
      t.integer    :price, null: false
      t.references :seller, null: false

      t.timestamps
    end
  end
end
