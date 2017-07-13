class AddSucessoToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :sucesso, :boolean, default: false
  end
end
