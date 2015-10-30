class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :pictures, :products do |t|
      # t.index [:picture_id, :product_id]
      # t.index [:product_id, :picture_id]
    end
  end
end
