# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'


response = open("https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list").read
attributes = JSON.parse(response)
attributes['drinks'].each {|data|
  Ingredient.create(name: data['strIngredient1'] )
}

response = open("https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail").read
attributes = JSON.parse(response)
attributes['drinks'].each {|data|
  cocktail = Cocktail.create(name: data['strDrink']) # photo : data['strDrinkThumb]'
  id = data['idDrink']
  response = open("https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=#{id}").read
  attributes = JSON.parse(response)
  attributes['drinks'].each {|data|
    number = 1
    while number < 15
      if data["strIngredient#{number}"] != ""
        save = Ingredient.find_by(name: data["strIngredient#{number}"])
        description = data["strMeasure#{number}"]
        dose = Dose.new(description: description)
        dose.ingredient = save
        dose.cocktail = cocktail
        dose.save
      else
        break
      end
      number +=1
    end
  }
}

