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
end

def create_recipe_array(ingredient)
  arr = []
  Recipe.all.select do |recipe|
    recipe.ingredients.split(",").find do |ing|
      if ing == ingredient
        arr << recipe
      end
    end
  end
  return arr.uniq
end

def get_recipe_limit(recipe_array, ingredient)
  puts
  puts <<~TEXT
  There are #{recipe_array.length} recipes that include #{ingredient}.
  How many would you like to view?
  TEXT
  choice = gets.chomp
end

def view_recipes(recipe_array, limit)
  puts
  puts "Here you go!"
  recipe_array[0..limit.to_i].each_with_index do |recipe, i|
    puts
    puts "#{i+1}. #{recipe.name}"
    puts "#{recipe.ingredients}"
  end
end

def recipe_menu
  puts
  puts "Please choose one:"
  puts "0. Return to main menu"
  puts "1. Save a recipe to favorites"
  choice = gets.chomp
end

def recipe_menu_selection(choice, selected_recipes=nil)
  case choice
  when "0"
    # return to main menu
    main_menu
  when "1", "save"
    # save a recipe to favorites
    save_to_favorites(selected_recipes)
  else
    puts "Invalid choice!"
  end
end

def save_to_favorites(selected_recipes)
  puts
  puts "Which recipe would you like to save? Type the number:"
  choice = gets.chomp
  recipe = selected_recipes[choice.to_i - 1]

  # checks user's favorites to make sure it hasn't been added yet
  $username.favorites.each do |fav|
    if fav.recipe_id == recipe.id
      puts
      puts "You've already added this recipe to your favorites!"
      puts "Returning to menu..."
      recipe_menu
    end
  end

  puts
  puts "Save #{recipe.name}? (y/n)"
  choice = gets.chomp
  case choice
  when "y", "yes"
    $username.add_favorite(recipe)
    puts
    puts "#{recipe.name} added to your favorites!"
    puts "Returning to menu..."
    recipe_menu
  when "n", "no"
    puts "Returning to menu..."
    recipe_menu
  else
    puts "Invalid input!"
  end
end
