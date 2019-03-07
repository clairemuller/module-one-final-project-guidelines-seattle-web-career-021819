
def get_ingredient_from_user
  puts
  puts "Please enter an ingredient:"
  ingredient = gets.chomp.downcase
  create_recipe_array(ingredient)
end

def create_recipe_array(ingredient)
  recipe_array = []
  num = 0
  Recipe.all.each do |recipe|
    if recipe.ingredients.include?(ingredient)
      recipe_array << recipe.name
    end
  end
  recipe_array
  puts "There are #{recipe_array.length} recipes that include #{ingredient}.
  How many would you like to view?"
  choice = gets.chomp
  view_recipes(choice, recipe_array)
  binding.pry
end

def view_recipes(choice, recipe_array)
  puts "Here you go!"
  recipe_array
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
    get_recipes_by_ingredient(ingredient)
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
