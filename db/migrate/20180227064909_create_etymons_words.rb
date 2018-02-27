class CreateEtymonsWords < ActiveRecord::Migration[5.0]
  def change
    create_table :etymons_words do |t|
      t.integer :etymon_id
      t.integer :word_id

      t.timestamps
    end
  end
end
