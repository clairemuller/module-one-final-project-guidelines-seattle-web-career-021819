def recipe_search
  ingredient = get_ingredient_from_user
  recipe_array = create_recipe_array(ingredient)
  limit = get_recipe_limit(recipe_array, ingredient)
  selected_recipes = view_recipes(recipe_array, limit)
  rms = recipe_menu
  recipe_menu_selection(rms, selected_recipes)
end

def get_ingredient_from_user
  puts
  puts "Please enter an ingredient:"
  ingredient = gets.chomp.downcase
  # create_recipe_array(ingredient)
end

def create_recipe_array(ingredient)
  Recipe.all.select do |recipe|
    recipe.ingredients.include?(ingredient)
  end
end

def get_recipe_limit(recipe_array, ingredient)
  puts <<~TEXT
  There are #{recipe_array.length} recipes that include #{ingredient}.
  How many would you like to view?
  TEXT
  choice = gets.chomp
end

def view_recipes(recipe_array, limit)
  puts "Here you go!"
  recipe_array[1..limit.to_i].each_with_index do |recipe, i|
    puts "#{i+1}. #{recipe.name}"
    puts "#{recipe.ingredients}"
    puts
  end
end

def recipe_menu
  puts "Please choose one:"
  puts "0. Return to main menu"
  puts "1. Save a recipe to favorites"
  choice = gets.chomp
end

def recipe_menu_selection(choice, selected_recipes)
  case choice
  when "0"
    # return to main menu
    main_menu
  when "1", "save"
    # save a recipe to favorites
    # still working on this method
    save_to_favorites(selected_recipes)
  else
    puts "Invalid choice!"
  end
end

def save_to_favorites(selected_recipes)
  puts
  puts "Which recipe(s) would you like to save? Type the number(s):"
  choice = gets.chomp
  recipe = selected_recipes[choice.to_i - 1]
  puts "Save #{recipe.name}? (y/n)"
  choice = gets.chomp
  case choice
  when "y", "yes"
    if $username.favorites.find do |fav|
      recipe.id == fav.recipe_id
      puts
      puts "You've already added this recipe to your favorites!"
      recipe_menu
      end
    else
      $username.add_favorite(recipe)
    end
  when "n", "no"
    recipe_menu
  else
    "Invalid input!"
  end
end
