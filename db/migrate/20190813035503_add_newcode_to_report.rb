class AddNewcodeToReport < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :code, :string
    add_column :reports, :error, :string
  end
end
