class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :name
      t.string :email
      t.text :text
      t.boolean :confirmation, default: false

      t.timestamps null: false
    end
  end
end
