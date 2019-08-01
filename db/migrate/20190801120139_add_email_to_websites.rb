class AddEmailToWebsites < ActiveRecord::Migration[5.0]
  def change
    add_column :websites, :email, :string
  end
end
