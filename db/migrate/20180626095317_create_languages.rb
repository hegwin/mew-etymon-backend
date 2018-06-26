class CreateLanguages < ActiveRecord::Migration[5.0]
  def change
    create_table :languages do |t|
      t.string :name
      t.string :name_cn
      t.string :period
      t.text :description
      t.integer :parent_id, null: true, index: true
      t.integer :lft, null: false, index: true
      t.integer :rgt, null: false, index: true
      t.integer :children_count, null: false, default: 0

      t.timestamps
    end
  end
end
