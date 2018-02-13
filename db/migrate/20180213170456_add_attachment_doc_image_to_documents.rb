class AddAttachmentDocImageToDocuments < ActiveRecord::Migration[5.1]
  def self.up
    change_table :documents do |t|
      t.attachment :doc_image
    end
  end

  def self.down
    remove_attachment :documents, :doc_image
  end
end
