class User < ApplicationRecord
  # section 1
  validates :name, presence: true
  validates :email, presence: true
  validates :bio, presence: true

  # section 2
  with_options if: :sec1_present? do |sec2|
    sec2.validates :city, presence: true
    sec2.validates :state, presence: true
    sec2.validates :zip, presence: true, length: { maximum: 5 }
  end

  # section 3
  with_options if: :sec2_present? do |sec3|
    sec3.validates :university, presence: true, on: :update
    sec3.validates :degree, presence: true, on: :update
    sec3.validates :grad_year, presence: true, on: :update, length: { maximum: 4 }
  end

  def sec1_present?
    name.present? && email.present? && bio.present?
  end

  def sec2_present?
    city.present? && state.present? && zip.present?
  end
end
