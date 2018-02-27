class CreateEtymons < ActiveRecord::Migration[5.0]
  def change
    create_table :etymons do |t|
      t.string :spelling
      t.string :meaning
      t.string :source
      t.text :evolution

      t.timestamps
    end
  end
end
