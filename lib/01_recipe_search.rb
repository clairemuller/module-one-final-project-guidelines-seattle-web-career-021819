def recipe_search
  ingredient = get_ingredient_from_user
  recipe_array = create_recipe_array(ingredient)
  limit = get_recipe_limit(recipe_array, ingredient)
  selected_recipes = view_recipes(recipe_array, limit)
  rms = recipe_menu
  recipe_menu_selection(rms, selected_recipes)
  main_menu
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
  if recipe_array.empty?
    puts "Sorry, there are no recipes with #{ingredient}!"
    puts "Let's try again..."
    recipe_search
  end
  puts <<~TEXT
  There are #{recipe_array.length} recipes that include #{ingredient}.
  How many would you like to view?
  TEXT
  choice = gets.chomp.to_i

  if choice > recipe_array.length
    puts
    puts "Oops! There are only #{recipe_array.length} recipes!"
    choice = recipe_array.length
  else
    choice
  end
end

def view_recipes(recipe_array, limit)
  puts
  puts "Here you go!"
  recipe_array[0...limit.to_i].each_with_index do |recipe, i|
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
    false
  when "1", "save"
    # save a recipe to favorites
    save_to_favorites(selected_recipes)
    true
  else
    puts "Invalid choice!"
    true
  end
end

def in_user_favorites?(recipe)
  # checks user's favorites to make sure it hasn't been added yet
  $username.favorites.each do |fav|
    if fav.recipe_id == recipe.id
      return true
    end
  end
  false
end

def save_to_favorites(selected_recipes)
  isrunning = true
  while isrunning
    puts
    puts "Which recipe would you like to save? Type the number (q to quit):"
    choice = gets.chomp
    if choice.start_with?("q")
      break
    end
    recipe = selected_recipes[choice.to_i - 1]
    # wanted to validate user's choice
    # if choice == nil
    #   return recipe_menu
    # elsif choice.to_i.is_a?(Integer) && choice.to_i < 10
    #
    # else
    #   puts "Invalid input"
    #   return recipe_menu
    # end
    # binding.pry

    if in_user_favorites?(recipe)
      puts
      puts "You've already added this recipe to your favorites!"
      # puts "Returning to menu..."
      next
    else
      puts
      puts "Save #{recipe.name}? (y/n)"
      choice = gets.chomp
      case choice
      when "y", "yes"
        $username.add_favorite(recipe)
        puts
        puts "#{recipe.name} added to your favorites!"
        binding.pry
        # puts "Returning to menu..."
      when "n", "no"
        puts "Returning to main menu..."
        isrunning = false
      else
        puts "Invalid input!"
      end
    end
  end

end
