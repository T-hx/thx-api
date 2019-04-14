class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :received_thx, :integer, default: 0, after: :thx_balance
  end
end
