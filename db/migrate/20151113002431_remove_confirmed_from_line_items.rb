class RemoveConfirmedFromLineItems < ActiveRecord::Migration
  def change
  	remove_column :line_items, :confirmed, :string
  	remove_column :line_items, :confirmed_at, :datetime
  end
end
