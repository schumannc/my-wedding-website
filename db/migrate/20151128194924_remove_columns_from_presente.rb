class RemoveColumnsFromPresente < ActiveRecord::Migration
  def change
  	remove_column :presentes, :cota, :decimal
  	remove_column :presentes, :percent, :decimal
  	add_column :presentes, :arrecadado, :decimal, precision:8, scale:2, default: 0
  end
end
