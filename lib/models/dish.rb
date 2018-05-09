class Dish < ActiveRecord::Base
    has_many :orders
    has_many :customers, through: :orders

    def self.is_vegetarian
       all.select {|dish| dish.vegetarian == true }
    end

    def self.not_vegetarian
        all.select {|dish| dish.vegetarian == false }
    end

    def self.spicy_and_vegetarian(num)
        if num<=3
            is_vegetarian.select {|dish| dish.spiciness <=3 }
        elsif num>3 && num <6
            is_vegetarian.select {|dish| dish.spiciness >3 && dish.spiciness < 6 }
        else
            is_vegetarian.select {|dish| dish.spiciness >6 }
        end
    end

    def self.spicy_and_non_vegetarian(num)
        if num<=3
            not_vegetarian.select {|dish| dish.spiciness <=3 }
        elsif num>3 && num <6
            not_vegetarian.select {|dish| dish.spiciness >3 && dish.spiciness < 6 }
        else
            not_vegetarian.select {|dish| dish.spiciness >6 }
        end
    end

    vegetarian = self.spicy_and_vegetarian(num)
    nonvegetarian = self.spicy_and_non_vegetarian(num)

    def self.veg_calorie_count(num)
        vegetarian.select {|dish| dish.calories <= num}
    end

    def self.nonveg_calorie_count(num)
      nonvegetarian.select {|dish| dish.calories <= num}
    end

    vegcaloriecount = self.veg_calorie_count(num)
    nonvegcaloriecount = self.nonveg_calorie_count(num)

    def self.veg_price(num)
      vegcaloriecount.select {|dish| dish.price <= num}
    end

    def self.nonveg_price(num)
      nonvegcaloriecount.select {|dish| dish.price <= num}
    end


end




# def self.vegetarian?(answer)
#   if answer == yes
#     all.select {|dish| dish.vegetarian == true }
#   if answer == no
#     all.select {|dish| dish.vegetarian == false }
#   end
# end
#
# def self.spicy
# end
#
# def self.calories
# end
#
# def self.price
# end
