class AddFolderIdToCabinets < ActiveRecord::Migration
  def change
    add_column :cabinets, :folder_id, :integer
    add_index :cabinets, :folder_id

  end
end
