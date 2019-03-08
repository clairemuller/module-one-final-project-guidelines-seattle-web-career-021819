def most_favorite_recipes
  system "clear"
  results = Favorite.all.group(:recipe_id).count
  results = results.sort_by {|k,v| v}.reverse
  puts
  puts "There are #{results.count} recipes favorited."
  print "How many recipes would you like to see? "
  input = gets.chomp.to_i

  if input > results.count
    puts
    puts "Oops! We only have #{results.count} recipes favorited!"
    input = results.count
  end

  show_favorites(results, input)
  sleep(3)
  puts
  puts "Screen will clear in 5 seconds..."
  sleep(5)
  system "clear"
  main_menu
end

def show_favorites(results, input)
  puts
  puts "The top #{input} recipes are:"
  results[0...input].each_with_index do |result, i|
    recipe = Recipe.find(result[0])
    puts "#{i+1}. #{recipe.name}"
    sleep(0.5)
  end
end
