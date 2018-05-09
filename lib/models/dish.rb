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

   
    
    
end