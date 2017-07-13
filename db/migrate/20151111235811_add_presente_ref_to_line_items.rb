class AddPresenteRefToLineItems < ActiveRecord::Migration
  def change
    add_reference :line_items, :presente, index: true, foreign_key: true
  end
end
