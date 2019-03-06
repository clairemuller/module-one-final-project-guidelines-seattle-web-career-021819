def view_user_favorites
  faves = $username.favorites

  if faves.empty?
    puts "You don't have any favorites saved yet!"
    puts "Returning to main menu..."
    puts
    main_menu
  else
    faves
  end

end
