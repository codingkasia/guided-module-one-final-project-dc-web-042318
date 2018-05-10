class Dish < ActiveRecord::Base
    has_many :orders
    has_many :customers, through: :orders

end


#<Dish:0x007ffcf1ca3f28 id: 1, name: "spaghetti", vegetarian: true, spiciness: 1, calories: 900, price: 12>,
  #<Dish:0x007ffcf1ca30c8 id: 5, name: "baguette", vegetarian: true, spiciness: 1, calories: 900, price: 3>,
  #<Dish:0x007ffcf1ca2a38 id: 7, name: "pad thai", vegetarian: true, spiciness: 5, calories: 900, price: 11>,
  #<Dish:0x007ffcf1ca1bd8 id: 13, name: "shrimp scampi", vegetarian: true, spiciness: 3, calories: 1100, price: 23>,
  #<Dish:0x007ffcf1ca1728 id: 15, name: "caesar salad", vegetarian: true, spiciness: 1, calories: 500, price: 14>,
  #<Dish:0x007ffcf1ca15e8 id: 16, name: "house salad", vegetarian: true, spiciness: 1, calories: 350, price: 12>,
  #<Dish:0x007ffcf1ca1480 id: 17, name: "seared tuna tataki salad", vegetarian: true, spiciness: 1, calories: 500, price: 20>
