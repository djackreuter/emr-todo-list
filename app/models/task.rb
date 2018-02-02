class Task < ApplicationRecord
  belongs_to :list, inverse_of: :tasks
end
