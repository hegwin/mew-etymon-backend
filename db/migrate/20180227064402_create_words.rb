class CreateWords < ActiveRecord::Migration[5.0]
  def change
    create_table :words do |t|
      t.string :spelling
      t.string :meaning
      t.text :etymon_analysis

      t.timestamps
    end
  end
end
