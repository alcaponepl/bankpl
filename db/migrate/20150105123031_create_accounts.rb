class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.references :client, index: true, null:false
      t.integer :number, null: false
      t.integer :balance, null: false, default: 0

      t.timestamps null: false
    end
    add_foreign_key :accounts, :clients
  end
end
