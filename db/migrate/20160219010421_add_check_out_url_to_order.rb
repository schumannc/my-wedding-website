class AddCheckOutUrlToOrder < ActiveRecord::Migration
  def change
  	add_column :orders, :url, :string
  end
end
