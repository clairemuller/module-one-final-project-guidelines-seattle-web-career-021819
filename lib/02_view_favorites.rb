def view_user_favorites
  faves = $username.favorites

  if faves.empty?
    puts
    puts "You don't have any favorites saved yet!"
    puts "Returning to main menu..."
    main_menu
  else
    puts
    puts "Here are your favorite recipes:"
    i = 1
    faves.each do |fave|
      puts "#{i}. #{fave.recipe.name}"
      i += 1
      sleep(0.5)
    end
    puts
    puts "Returning to main menu..."
    main_menu
  end

end
