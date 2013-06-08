class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :group
      t.datetime :date
      t.string :locale
      t.references :team1
      t.references :team2
      t.integer :final_result1
      t.integer :final_result2

      t.timestamps
    end
    add_index :matches, :team1_id
    add_index :matches, :team2_id
  end
end
