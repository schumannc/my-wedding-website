class AddPagseguroToOrder < ActiveRecord::Migration
  def change
  	add_column :orders, :pagseguro, :boolean, default: false
  end
end
