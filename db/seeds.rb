require 'open-uri'

Ingredient.destroy_all

url = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"

file = open(url).read

json = JSON.parse(file)

json['drinks'].each do |ingredient|
  Ingredient.create name: ingredient['strIngredient1']
end
