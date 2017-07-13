class AddMenssagemToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :mensagem, :text
  end
end
