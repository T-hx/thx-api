class ThxTxns < ActiveRecord::Migration[5.2]
  def change
    create_table :thx_txns do |t|
      t.string :thx_hash
      t.references :sender, foreign_key: { to_table: :users }
      t.references :receiver, foreign_key: { to_table: :users }
      t.integer :thx
      t.text :comment

      t.timestamps
    end
  end
end
