class List < ApplicationRecord
  has_many :tasks, inverse_of: :list
  validates :name, presence: true
end
