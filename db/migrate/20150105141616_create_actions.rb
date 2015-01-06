class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.string :name
      t.datetime :date_from
      t.datetime :date_to
      t.string :discount_type
      t.float :discount_value
      t.integer :tag_id
      t.integer :product_id
      t.integer :count

      t.timestamps
    end
    add_index :actions, :date_from
    add_index :actions, :date_to
  end
end
