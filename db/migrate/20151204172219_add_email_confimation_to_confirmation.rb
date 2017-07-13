class AddEmailConfimationToConfirmation < ActiveRecord::Migration
  def change
    add_column :confirmations, :email_confirmed, :boolean, default: true
    add_column :confirmations, :confirm_token, :string
  end
end
