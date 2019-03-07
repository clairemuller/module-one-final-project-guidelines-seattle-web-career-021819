def recipe_search
  ingredient = get_ingredient_from_user
  recipe_array = create_recipe_array(ingredient)
  limit = get_recipe_limit(recipe_array)
  view_recipes(recipe_array, limit)
  rms = recipe_menu
  recipe_menu_selection(rms)

end

def get_ingredient_from_user
  puts
  puts "Please enter an ingredient:"
  ingredient = gets.chomp.downcase
  # create_recipe_array(ingredient)
end

def create_recipe_array(ingredient)
  recipe_array = []
  num = 0
  Recipe.all.each do |recipe|
    if recipe.ingredients.include?(ingredient)
      recipe_array << recipe.name
    end
  end
end

def get_recipe_limit(recipe_array)
  puts "There are #{recipe_array.length} recipes that include #{ingredient}.
  How many would you like to view?"
  choice = gets.chomp
end

def view_recipes(recipe_array, limit)
  puts "Here you go!"
  recipe_array[1..limit.to_i].each_with_index do |recipe, i|
    puts "#{i+1}. #{recipe["title"]}"
    puts "#{recipe["ingredients"]}"
    puts
  end
end

def recipe_menu
  puts "Please choose one:"
  puts "0. Return to main menu"
  puts "1. Save a recipe to favorites"
  puts "2. See the next ten recipes"
  choice = gets.chomp
end

def recipe_menu_selection(choice)
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
  recipes = recipe_search.recipe_array
  puts
  puts "Which recipe(s) would you like to save? Type the number(s):"
  choice = gets.chomp
  if !choice.empty?
    recipes.select do |recipe|
      choice.map do |i|
        $username.add_favorite(recipe[i])
      end
    end
  end

end
