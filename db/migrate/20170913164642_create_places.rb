class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|

      t.text :name
      t.date :last_visited
      t.integer :minutes_away
      t.integer :ledger_id

      t.timestamps
    end

    add_index :places, :ledger_id

  end
end
