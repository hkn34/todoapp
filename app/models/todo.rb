class Todo < ApplicationRecord
  # Validates that the Todo being created has a name
  validates :name, presence: true
  # Validates that the Todo being created has a description
  validates :description, presence: true

  belongs_to :user
end
