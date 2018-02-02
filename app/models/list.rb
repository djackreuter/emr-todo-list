class List < ApplicationRecord
  has_many :tasks, inverse_of: :list, dependent: :destroy
  validates :name, presence: true
  accepts_nested_attributes_for :tasks, allow_destroy: true, reject_if: proc { |attr| attr['name'.blank?] }
end
