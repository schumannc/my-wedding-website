class CreatePresentes < ActiveRecord::Migration
  def change
    create_table :presentes do |t|
      t.string :item
      t.string :image_url
      t.text :description
      t.text :details
      t.decimal :total, precision:8, scale:2, default: 0
      t.decimal :cota, precision:8, scale:2, default: 0
      t.decimal :percent, precision:8, scale:1, default: 0

      t.timestamps null: false

      t.timestamps null: false
    end
  end
end
