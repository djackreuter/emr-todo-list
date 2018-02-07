class Task < ApplicationRecord
  belongs_to :list, inverse_of: :tasks
  validates :task, presence: true
end
