class Order < ActiveRecord::Base
    belongs_to :dishes
    belongs_to :customers
end