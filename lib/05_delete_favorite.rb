def get_recipe_to_delete
  favorites = $username.favorites
  fav_to_delete = display_faves(favorites)
  $username.delete_favorite(fav_to_delete)
  main_menu
end

def display_faves(favorites)
  puts
  puts "Here are all your favorites:"
  favorites.each_with_index do |fave, i|
    recipe = Recipe.find(fave.recipe_id)
    puts "#{i+1}. #{recipe.name}"
  end
  puts
  print "Which recipe would you like to remove from favorites? "
  rec_num = gets.chomp.to_i
  puts
  recipe = Recipe.find(favorites[rec_num-1].recipe_id)
  print "Confirm deletion of #{recipe.name}? (y/n) "
  yn = gets.chomp.downcase
  if yn.start_with?("y")
    recipe
  end
end
