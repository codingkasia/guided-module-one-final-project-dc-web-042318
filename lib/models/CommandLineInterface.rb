class CommandLineInterface

  @@veg_foods = []
  @@spicy_foods = []
  @@calorie_foods = []
  @@price_foods = []

  def greet
    puts "Welcome to Big Papis!"
    puts "Don't know what to eat? We can help with that!"
  end

  def veg_foods
    @@veg_foods
  end

  def spicy_foods
    @@spicy_foods
  end

  def calorie_foods
    @@calorie_foods
  end

  def price_foods
    @@price_foods
  end


  def gets_user_input
    user_input = gets.chomp.downcase
    #this line defaults input to have only a capital first letter
    # user_input.slice(0,1).capitalize + user_input.slice(1..-1)
  end

  def run
    greet
    name_question
    customer_question
    vegetarian_question
    spicy_question
    calorie_question
    price_question
    still_picky
  end

  def name_question
    puts "What's your name?"
    user_input = gets_user_input
    puts "Hi #{user_input.capitalize}! Welcome to Big Papis!"
  end

  def customer_question
    puts "What's your email address?"
    user_input = gets_user_input
    Customer.find_or_create_by(email: user_input)
  end

  def vegetarian_question
    puts "Are you a vegetarian? (y/n)"
    user_input = gets_user_input
    if user_input == 'y'
      appropriate_dishes = Dish.all.select{|n| n.vegetarian}
    elsif user_input == 'n'
      appropriate_dishes = Dish.all.select{|n| !n.vegetarian}
    end
    @@veg_foods << appropriate_dishes
    appropriate_dishes.each {|v| puts v.name}
  end

  def spicy_question
    puts "How spicy do you like your food? Please put a number between 1 and 10"
    user_input = gets_user_input
    if user_input.to_i <= 3
      appropriate_dishes = Dish.all.select {|dish| dish.spiciness <=3}
    elsif  user_input.to_i > 3 && user_input.to_i < 6
      appropriate_dishes = Dish.all.select {|dish| dish.spiciness > 3 && dish.spiciness < 6}
    else
      appropriate_dishes = Dish.all.select {|dish| dish.spiciness >=6 }
    end
    @@spicy_foods << appropriate_dishes
    appropriate_dishes.each {|v| puts v.name}
  end

  def calorie_question
    puts "What's the max number of calories you want your dish to have?"
    user_input = gets_user_input
    appropriate_dishes = Dish.all.select {|dish| dish.calories <= user_input.to_i}
    @@calorie_foods << appropriate_dishes
    appropriate_dishes.each {|v| puts v.name}
  end

  def price_question
    puts "What's the max you want to spend for your dish?"
    user_input = gets_user_input
    appropriate_dishes = Dish.all.select {|dish| dish.price <= user_input.to_i}
    @@price_foods << appropriate_dishes
    appropriate_dishes.each {|v| puts v.name}
  end

  def still_picky
    puts "Still can't decide? (y/n)"
    user_input = gets_user_input
    puts "Here are the dish(es) that fit all of your preferences!"
    if user_input == "y"
      appropriate_dishes = @@veg_foods[0] & @@spicy_foods[0] & @@calorie_foods[0] & @@price_foods[0]
      appropriate_dishes.each {|v| puts v.name}
    else user_input == "n"
      puts "Great!"
    end
  end

end
