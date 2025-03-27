class CreateSites < ActiveRecord::Migration[8.0]
  def change
    create_table :sites do |t|
      t.string :favicon
      t.string :url

      t.timestamps
    end
  end
end
