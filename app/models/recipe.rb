class Recipe < ApplicationRecord
  # Association with the Image model
  has_many :images
  has_many :reviews

  # Validates that the title must be present and not empty
  validates :title, presence: true

  # Additional example validations:
  validates :cuisine, presence: true
  validates :meal_type, presence: true
  validates :cooking_instructions, presence: true, length: { minimum: 10 }

  # You can also include unique constraints:
  validates :title, uniqueness: true

  # And format validations with regular expressions:
  # validates :cuisine, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
end

