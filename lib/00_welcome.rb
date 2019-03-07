def welcome
  puts
  puts "Hello!  Welcome to Foodflix!"
  puts splashpage
end

def get_user_name_from_db
  puts
  puts "Please enter username:"
  name = gets.chomp
  User.find_by(name: name)
end

def create_user_name
  puts
  puts "Create username:"
  name = gets.chomp
  User.create(name: name)
end

def get_user_name
  run = true
  puts
  puts "Have you been here before? (y/n)"
  choice = gets.chomp.downcase

  if choice == "y" || choice == "yes"
    while run
      user = get_user_name_from_db
      if user == nil
        user_equals_nil
      else
        puts
        puts "Welcome back #{user.name}"
        run = false
        return user
      end
    end
  elsif choice == "n" || choice == "no"
    user = create_user_name
    puts
    puts "Welcome to Foodflix, #{user.name}!"
  else
    puts
    puts "Please enter (y)es or (n)o"
  end
end

def user_equals_nil
  puts
  puts "cannot find user"
  puts "Would you like to:"
  puts "1. search again"
  puts "2. create new user"
  choice = gets.chomp
  istrue = true
  case choice
  when "1"
    get_user_name
  when "2"
    create_user_name
  else
    puts
    puts "Please select either 1 or 2"
  end
end

def main_menu
  puts
  puts "Please pick a number:"
  puts "0. exit"
  puts "1. search for a recipe by ingredient"
  puts "2. view favorite recipes"
  puts "3. view most popular recipes"
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
  else
    puts
    puts "Invalid input!"
  end
end


# def get_and_return_user_input
#   choice = gets.chomp
# end
