class CreateLogs < ActiveRecord::Migration[8.0]
  def change
    create_table :logs do |t|
      t.string :og_url
      t.string :url
      t.string :slug
      t.string :title
      t.string :caption
      t.references :category, null: false, foreign_key: true
      t.string :metadata_raw

      t.timestamps
    end
    add_index :logs, :slug, unique: true
  end
end
