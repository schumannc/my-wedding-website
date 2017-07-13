class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.decimal :valor, precision:8, scale:2, default: 0
      t.string :confirmed, default: "No"
      t.datetime :confirmed_at

      t.timestamps null: false
    end
  end
end
