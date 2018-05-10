class Dish < ActiveRecord::Base
    has_many :orders
    has_many :customers, through: :orders

    def self.vegetarian(vegetarian)
        if vegetarian.downcase == "y"
            all.select {|dish| dish.vegetarian }
        else 
            all.select {|dish| !dish.vegetarian }
        end
    end

    def self.spicy(num)
        if num <= 3
            all.select {|dish| dish.spiciness <= 3 }
        elsif (num> 3) && (num < 6)
            all.select {|dish| dish.spiciness > 3 && dish.spiciness < 6 }
        else
            all.select {|dish| dish.spiciness >6 }
        end
    end

    def self.calorie_count(num)
        all.select {|dish| dish.calories <= num}
    end

    def self.price(num)
      all.select {|dish| dish.price <= num}
    end

end






