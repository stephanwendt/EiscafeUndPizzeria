class CreateContactMessages < ActiveRecord::Migration
  def change
    create_table :contact_messages do |t|
      t.text :message
      t.references :customer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
