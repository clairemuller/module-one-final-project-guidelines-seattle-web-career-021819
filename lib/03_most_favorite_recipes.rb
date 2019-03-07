def most_favorite_recipes
  print "How many of the top recipes would you like to see?  "
  choice = gets.chomp
  show_favorites(choice)
end

def show_favorites(limit)
  recipes = Recipe.all.group(:recipe_id).count
  recipes[0..limit].each do |recipe|
    puts "#{i+1}. #{recipe.name}"
  end
end
