# helper that sorts all favorites by count
def sort
  count = Favorite.all.group(:recipe_id).count
  sorted = count.sort_by { |k, v| v }.reverse
  sorted
end

def most_favorite_recipes
  sorted_favorites = sort
  puts
  puts "There are #{sorted_favorites.count} recipes favorited."
  puts "How many of these recipes would you like to see?"
  choice = gets.chomp.to_i
  if choice > sorted_favorites.count
    puts
    puts "Oops! We only have #{sorted_favorites.count} recipes favorited!"
    puts "Here they are:"
    choice = sorted_favorites.count
    show_favorites(choice)
  else
    show_favorites(choice)
  end
end

def show_favorites(choice)
  sorted_favorites = sort
  distinct_faves = Favorite.all.select(:recipe_id).distinct
  i = 1

  distinct_faves.all.each do |xx|
    sorted_favorites[0...choice].find do |yy|
      if xx.recipe_id == yy[0]
        puts
        puts "##{i}: #{xx.recipe.name}"
        i += 1
      end
    end
  end
  puts
  puts "Returning to main menu..."
  main_menu
end
