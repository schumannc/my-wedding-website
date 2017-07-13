class AddColumnsToLineItens < ActiveRecord::Migration
  def change
  	add_column :line_items, :item, :string
  	add_column :line_items, :url, :string
  	add_column :line_items, :arrecadado, :decimal, precision:8, scale:2, default: 0
  	add_column :line_items, :image_url, :string
  end
end
