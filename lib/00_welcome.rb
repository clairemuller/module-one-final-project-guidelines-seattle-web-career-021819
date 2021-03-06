def welcome
  system "clear"
  puts splashpage
  puts food
end

def get_user_name
  puts
  puts "Have you been here before? (y)es/(n)o"
  choice = gets.chomp.downcase
  if choice.start_with?("y")
    get_user_name_from_db
  elsif choice.start_with?("n")
    create_user_name
  else
    puts "Please enter (y)es or (n)o:"
    get_user_name
  end
end

def get_user_name_from_db
  puts
  print "Please enter your username: "
  name = gets.chomp
  user = User.find_by(name: name)
  if user == nil
    user_equals_nil
  else
    puts
    puts "Welcome back, #{user.name}!"
    return user
  end
end

def validate_user_name(name)
  if User.find_by(name: name) != nil
    puts "User name already exists"
    print "Would you like to (u)se this name or (c)reate a new user name? "
    choice = gets.chomp
    if choice.start_with?("u")
      print "Welcome back, #{name}!"
      return User.find_by(name: name)
    elsif choice.start_with?("c")
      create_user_name
    else
      puts "Invalid option/choice"
      get_user_name_from_db
    end
  end
end

def create_user_name
  puts
  print "Create username: "
  name = gets.chomp
  validate_user_name(name)
  puts
  puts "Welcome to Foodflix, #{name}!"
  User.create(name: name)
end

def get_user_name
  print "Have you been here before? (y)es/(n)o: "
  choice = gets.chomp.downcase
  if choice.start_with?("y")
    get_user_name_from_db
  elsif choice.start_with?("n")
    create_user_name
  else
    puts
    puts "Please enter (y)es or (n)o"
    get_user_name
  end
end

def user_equals_nil
  puts
  puts "We can't find that user!"
  puts "Would you like to:"
  puts "1. search again"
  puts "2. create new user"
  choice = gets.chomp
  istrue = true
  while istrue
    case choice
    when "1"
      get_user_name_from_db
      istrue = false
    when "2"
      create_user_name
      istrue = false
    else
      puts "Please select either 1 or 2"
    end
  end
end

def main_menu
  puts
  puts "MAIN MENU"
  puts "0. exit"
  puts "1. search for a recipe by ingredient"
  puts "2. view your favorite recipes"
  puts "3. view most popular recipes"
  puts "4. get recommendations"
  puts "5. delete a recipe from your favorites list"
  choice = gets.chomp
  menu_selection(choice)
end

def menu_selection(choice)
  case choice
  when "0", "exit"
    puts
    puts "Goodbye #{$username.name}! Happy cooking!"
  when "1", "search"
    # search for a recipe by ingredient
    recipe_search
  when "2"
    # view user's favorite recipes
    view_user_favorites
  when "3"
    # view most popular recipes
    most_favorite_recipes
  when "4"
    recommendations
  when "5"
    get_recipe_to_delete
  else
    puts
    puts "Invalid input!"
  end
end
