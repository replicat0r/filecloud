class AddAttachmentUploadedFileToCabinets < ActiveRecord::Migration
  def self.up
    change_table :cabinets do |t|
      t.attachment :uploaded_file
    end
  end

  def self.down
    remove_attachment :cabinets, :uploaded_file
  end
end
