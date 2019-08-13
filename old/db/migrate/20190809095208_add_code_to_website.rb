class AddCodeToWebsite < ActiveRecord::Migration[5.0]
  def change
    add_column :websites, :code, :string
  end
end
