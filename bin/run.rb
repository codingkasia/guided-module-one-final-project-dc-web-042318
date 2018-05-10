require_relative '../config/environment.rb'
require 'pry'


#when we get an input from a user:


# def veg_result(answer1, answer2, answer3, answer4)
#     (Dish.is_vegetarian) & (Dish.spicy(answer2)) & (Dish.calorie_count(answer3)) & (Dish.price(answer4))
# end

# def non_veg_result(answer1, answer2, answer3, answer4)
#     Dish.not_vegetarian & Dish.spicy(answer2) & Dish.calorie_count(answer3) & Dish.price(answer4)
# end

# def final_result(answer1, answer2, answer3, answer4)
#     if answer1 = 1
#         Dish.is_vegetarian & Dish.spicy(answer2) & Dish.calorie_count(answer3) & Dish.price(answer4)
#     else
#         Dish.not_vegetarian & Dish.spicy(answer2) & Dish.calorie_count(answer3) & Dish.price(answer4)
#     end
# end

# answer1 = "y"
# answer2 = 7
# answer3 = 1000
# answer4 = 16
# (Dish.vegetarian(answer1)) & (Dish.spicy(answer2)) & (Dish.calorie_count(answer3)) & (Dish.price(answer4))



def help_me_choose 
    puts "whats your name?"
    name = gets.chomp
    customer = Customer.find_or_create_by(name: name)
    puts "Do you want a vegetarian dish? Enter 1 for vegetarian and 2 for non-vegetarian"
    vegetarian = gets.chomp
    puts "On a scale from 1 to 10, where 1 is least spicy, enter how spicy your dish should be?"
    spicy = gets.chomp
    puts "What is a max number of calories you want your dish to have?"
    calories = gets.chomp
    puts "What is a max amount of money you want to spend?"
    price = gets.chomp

    dish_choices = (Dish.vegetarian(vegetarian)) & (Dish.spicy(spicy)) & (Dish.calorie_count(calories)) & (Dish.price(price))
    return dish_choices

end

binding.pry
puts "done"