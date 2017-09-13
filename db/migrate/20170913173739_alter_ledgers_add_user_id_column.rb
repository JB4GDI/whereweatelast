class AlterLedgersAddUserIdColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :ledgers, :user_id, :integer

    add_index :ledgers, :user_id
  end
end
