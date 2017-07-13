class AddItemUrlToPresente < ActiveRecord::Migration
  def change
  	 add_column :presentes, :url, :string
  	 add_index :presentes, :url, name: 'presente_url'
  end
end
