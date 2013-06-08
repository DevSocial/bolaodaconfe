class CreatePointings < ActiveRecord::Migration
  def change
    create_table :pointings do |t|
      t.string :name
      t.integer :point

      t.timestamps
    end
  end
end
