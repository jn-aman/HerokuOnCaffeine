class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.string :email
      t.string :url
      t.integer :up

      t.timestamps
    end
  end
end
