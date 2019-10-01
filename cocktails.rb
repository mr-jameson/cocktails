require "httparty"
require "json"

url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s="

# ask user for input of cocktail type

while true

    puts "What would you like to drink?"
    answer = gets.chomp
    
    # error proof input
    
    # use httparty to query cocktail api
    
    response = HTTParty.get("#{url}#{answer}")
    
    if response["drinks"] != nil
    

        puts "\n#{answer.capitalize}:"
        
        # present results
        puts "\nIngredients:"
        for ingredient_ref in 1..15
            if response["drinks"][0]["strIngredient#{ingredient_ref}"] != nil
            p response["drinks"][0]["strIngredient#{ingredient_ref}"]
            end
        end
    
        puts "\nMethod:"
        p response["drinks"][0]["strInstructions"]
        break
    
    else
        puts "\nPlease enter a cocktail"
        next
    end

end

