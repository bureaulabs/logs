class AddIsPublishedToEntries < ActiveRecord::Migration[8.0]
  def change
    add_column :entries, :is_published, :boolean, default: false
  end
end
