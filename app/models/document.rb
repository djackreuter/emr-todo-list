class Document < ApplicationRecord
  has_attached_file :doc_image, styles: { doc_show: '595x842>' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :doc_image, content_type: /\Aimage\/.*\z/
end
