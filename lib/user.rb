class User < ActiveRecord::Base
  has_many :favorites
  has_many :recipes, through: :favorites

  def add_favorite(recipe)
    f = Favorite.create(recipe_id: recipe.id, user_id: self.id)
    $username.favorites << f
  end

end
