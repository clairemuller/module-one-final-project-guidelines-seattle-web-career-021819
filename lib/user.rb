class User < ActiveRecord::Base
  has_many :favorites
  has_many :recipes, through: :favorites

  def add_favorite(recipe)
    f = Favorite.create(recipe_id: recipe.id, user_id: self.id)
    # $username.favorites << f
  end

  def delete_favorite(recipe)
    fave_id = Favorite.where(recipe_id: recipe.id, user_id: self.id).first.id
    Favorite.destroy(fave_id)
    # $username.favorites.destroy(recipe.id)
  end

end
