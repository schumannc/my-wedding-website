class CreateConfirmations < ActiveRecord::Migration
  def change
    create_table :confirmations do |t|
      t.string :name
      t.string :email
      t.integer :guets
      t.string :phone
      t.string :ip

      t.timestamps null: false
    end
    add_index :confirmations, :email
  end
end
