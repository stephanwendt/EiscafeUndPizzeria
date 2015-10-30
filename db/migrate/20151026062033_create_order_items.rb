class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.decimal :unit_price, precision: 12, scale: 2
      t.integer :quantity
      t.decimal :total_price, precision: 12, scale: 2
      t.text :comment
      t.references :order, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
