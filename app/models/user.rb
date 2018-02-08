class User < ApplicationRecord
  # section 1
  validates :name, presence: true
  validates :email, presence: true
  validates :bio, presence: true

  # section 2
  with_options if: :sec2_present? do |sec2|
    sec2.validates :city, presence: true
    sec2.validates :state, presence: true
    sec2.validates :zip, presence: true, length: { maximum: 5 }
  end

  # section 3
  with_options if: :sec3_present? do |sec3|
    sec3.validates :university, presence: true
    sec3.validates :degree, presence: true
    sec3.validates :grad_year, presence: true, length: { maximum: 4 }
  end

  def sec2_present?
    !city.nil? || !state.nil? || !zip.nil?
  end

  def sec3_present?
    !university.nil? || !degree.nil? || !grad_year.nil?
  end
end
