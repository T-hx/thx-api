class CreateThxTxns < ActiveRecord::Migration[5.2]
  def change
    create_table :thx_txns do |t|
      t.integer :thx
      t.text :comment
      t.string :sender
      t.string :receiver

      t.timestamps
    end
  end
end
