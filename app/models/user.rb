# app/models/user.rb
class User < ApplicationRecord
  # Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # Associations
  has_many :favorite_recipes
  has_many :reviews
end

# app/models/favorite_recipe.rb
class FavoriteRecipe < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :recipe
end

# app/models/review.rb
class Review < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :recipe
end

