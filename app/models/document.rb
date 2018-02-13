class Document < ApplicationRecord
  validates :name, presence: true

  has_attached_file :doc_file
  validates_attachment :doc_file, content_type: { content_type: "application/pdf" }
end
