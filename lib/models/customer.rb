class Customer < ActiveRecord::Base
    has_many :orders
    has_many :dishes, through: :orders

    # def print_name
    #     self.find_by(name)
    # end
end
