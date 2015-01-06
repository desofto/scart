class CreateProductTags < ActiveRecord::Migration
  def change
    create_table :product_tags do |t|
      t.integer :product_id
      t.integer :tag_id

      t.timestamps
    end
    add_index :product_tags, :product_id
    add_index :product_tags, :tag_id
    add_index :product_tags, [ :product_id, :tag_id ], unique: true
  end
end
