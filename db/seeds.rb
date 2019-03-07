require_relative "../config/environment"
# User.delete_all
# Favorite.delete_all
# Recipe.delete_all
#
# claire = User.create(name: "Claire")
# r1 = Recipe.create(name: "Gimlet", url: "http://www.recipezaar.com/Gimlet-8882")
# Recipe.create(name: "Toast", url: "http://www.recipezaar.com/jjddj98292")
# Recipe.create(name: "Punch", url: "http://www.recipezaar.com/sjkds8388")
# # Favorite.create(user_id: claire.id, recipe_id: r1.id)


# url = 'http://www.recipepuppy.com/api/?p='
# (1..100).each do |page|
#   response_string = RestClient.get("#{url}#{page}")
#   response_hash = JSON.parse(response_string)
#   recipes = response_hash["results"]
#   recipes.each do |recipe|
#     Recipe.create({
#     name: recipe["title"],
#     url: recipe["href"],
#     ingredients: recipe["ingredients"],
#     })
#   end
# end
