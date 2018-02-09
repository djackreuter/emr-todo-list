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

  def complete?
    grad_year.present?
  end

  def partial
    return 'form1' if is_form_1?
    return 'form2' if is_form_2?
    return 'form3' if is_form_3?
  end

  def form_1?
    name.blank? && email.blank? && bio.blank?
  end

  def form_2?
    city.blank? && state.blank? && zip.blank?
  end

  def form_3?
    university.blank? && degree.blank? && grad_year.blank?
  end
end
