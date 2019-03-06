# ingredient = get_ingredient_from_user
page_num = 1

def get_ingredient_from_user
  puts
  puts "Please enter an ingredient:"
  ingredient = gets.chomp.downcase
  get_recipes_by_ingredient(ingredient, page_num)
end

def get_recipes_by_ingredient(ingredient, page_num)
  url = 'http://www.recipepuppy.com/api/?i='
  response_string = RestClient.get(url + ingredient + "&p=#{page_num}")
  response_hash = JSON.parse(response_string)
  recipes = response_hash["results"]

  recipes.each_with_index do |xx, i|
    puts "#{i+1}. #{xx["title"].strip}"
    puts "ingredients: #{xx["ingredients"]}"
    puts
  end
  recipe_menu
end

def recipe_menu
  puts "Please choose one:"
  puts "0. Return to main menu"
  puts "1. Save a recipe to favorites"
  puts "2. See the next ten recipes"
  choice = gets.chomp
  case choice
  when "0"
    # return to main menu
    main_menu
  when "1", "save"
    # save a recipe to favorites
    # still working on this method
    save_to_favorites
  when "2"
    # see the next ten recipes
    # still working on this method
    page_num += 1
    get_recipes_by_ingredient(ingredient, page_num)
  else
    puts "Invalid choice!"
  end
end

def save_to_favorites
  # still working on this method
  puts
  puts "Which recipe would you like to save? Type the number:"
  choice = gets.chomp.downcase
  if choice == "y"

  elsif choice == "n"

  else
    puts "Invalid choice!"
  end
end

def next_ten
  binding.pry

end
