class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string  :email
      t.string :description
      t.decimal :amount
      t.references :presente, index: true, foreign_key: true
      t.references :line_item, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
