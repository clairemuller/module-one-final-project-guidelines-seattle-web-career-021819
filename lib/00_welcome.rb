def welcome
  puts "Hello!  Welcome to Foodflix!"
end

def get_user_name
  run = true
  while run
    puts "Have you been here before? (y/n)"
    choice = gets.chomp.downcase
    if choice == "y" || choice == "yes"
      puts "Please enter username:"
      name = gets.chomp
      run = false
      user = User.find_by(name: name)
      if user == nil
        puts "cannot find user"
      else
        puts "Welcome back #{user.name}"
        return user
      end
    elsif choice == "n"
      puts "Create username:"
      name = gets.chomp
      run = false
      return User.create(name: name)
    else
      puts "Please enter (y)es or (n)o"
    end
  end
end

def main_menu
  puts "Please make a selection"
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
    puts "Goodbye #{$username.name}! Happy cooking!"
  when "1", "search"
    # search for a recipe by ingredient
    get_ingredient_from_user
  when "2"
    # view user's favorite recipes
  when "3"
    # view most popular recipes
  else
    puts "Invalid input!"
  end
end


# def get_and_return_user_input
#   choice = gets.chomp
# end
