class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.references :match
      t.integer :result1
      t.integer :result2

      t.timestamps
    end
    add_index :results, :match_id
  end
end
