def view_user_favorites
  faves = $username.favorites

  if faves.empty?
    puts
    puts "You don't have any favorites saved yet!"
    puts "Returning to main menu..."
    puts
    main_menu
  else
    faves.each do |fave|
      puts fave.recipe.name
    end
  end

end
