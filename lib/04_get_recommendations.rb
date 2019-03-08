def recommendations
  faves = $username.favorites
  rec_id = get_rec_id_from_faves(faves)
  ings = get_ing_from_rec_id(rec_id)
  mcg = most_common_ingredient(ings).reverse
  display_mcg(mcg)
  first_mcg = mcg[0].first
  rec_array = create_recipe_array(first_mcg)
  id_array = get_id_array(rec_array)
  display_three_random_recommendations(id_array, first_mcg)
  main_menu
end

def get_rec_id_from_faves(faves)
  faves.map do |fave|
    fave.recipe_id
  end
end

def get_ing_from_rec_id(rec_id)
  ing_hash = {}
  rec_id.each do |rec|
    recipe = Recipe.find(rec)
    ings = recipe.ingredients.split(/, /)
    ings.each do |ing|
      if ing_hash[ing] == nil
        ing_hash[ing] = 1
      else
        ing_hash[ing] += 1
      end
    end
  end
  ing_hash
end

def most_common_ingredient(ings)
  ings.sort_by do |k,v|
    v
  end
end

def display_mcg(mcg)
  puts
  puts "The most common ingredient in your favorite recipes list is: #{mcg[0].first}"
end

def get_id_array(rec_array)
  rec_array.select do |rec|
    $username.favorites.each do |fav|
      rec.id != fav.id
    end
  end
end

def display_three_random_recommendations(id_array, first_mcg)
  three_recipes = []
  3.times do
    recipe = id_array.sample
    if !three_recipes.include?(recipe)
      three_recipes << recipe
    end
  end
  puts
  puts "Here are your recommended recipes with #{first_mcg}:"
  three_recipes.each_with_index do |recipe, i|
    puts
    puts "#{i+1}. #{recipe.name}"
    puts "#{recipe.ingredients}"
    sleep(1)
  end
end
