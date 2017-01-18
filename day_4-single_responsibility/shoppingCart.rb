require 'pry'

class Store
	attr_reader :item_stored
	def initialize
		@item_stored = {}
	end

	def add_item_to_store(item)
		@item_stored[item.name.to_sym] = item
	end
end

class ShoppingCart
	attr_reader :item_list
	
	def initialize
		@item_list = {}
	end

	def add_item_to_cart(item, amount=1)
		if @item_list.keys.include?(item.name.to_s)
			@item_list[item.name.to_sym] += amount
		else
			@item_list[item.name.to_sym] = amount
		end
	end

	def show_cart(item_stored)
		i = 0
		@item_list.each do |k, v|
			i += 1
			puts "#{i}. #{k.to_s}: #{item_stored[k.to_sym].price}€"
		end
	end


end

class Item
	attr_reader :name, :price
	def initialize( name, price )
		@name = name
		@price = price
	end
end

class Cost
	include Discount

	def self.calculate_cost(item_list, item_stored, discounts)
		cost = 0
		item_list.keys.each do |item|
			if item_discount.include?(item.name)

			else
				cost += item_list[item.to_sym] * item_stored[item.to_sym].price
			end
		end
		cost = apply_discounts(cost, discounts)
		cost
	end

	def apply_discounts(cost, discounts)
		if discounts

		end

	end
end

if amount
end


module Discount

	item_discount = ["apples", "oranges", "grapes"]

	def apply_discount(item)
		case item
		when item == "apples"
			apple_discount()
		when item == "oranges"
			oranges_discount()
		when item == "grapes"
			grapes_discount()
		end
	end

	def apples_discount(ap_cost, ap_amount)
		ap_cost * (ap_amount - ap_amount % 2) / 2 + ap_cost * ap_amount % 2
	end

	def oranges_discount(or_cost, or_amount)
		or_cost * (or_amount - or_amount % 3) / 3 * 2 + or_cost * or_amount % 3 
	end

	def grapes_discount(grap_amount, ban_amount)
		(grap_amount / 4).round(0) 
	end

end



store = Store.new
store.add_item_to_store(Item.new("apples", 10))
store.add_item_to_store(Item.new("oranges", 5))
store.add_item_to_store(Item.new("grapes", 15))
store.add_item_to_store(Item.new("banana", 20))
store.add_item_to_store(Item.new("watermelon", 50))

cart = ShoppingCart.new
cart.add_item_to_cart(store.item_stored[:apples])
cart.add_item_to_cart(store.item_stored[:apples])
cart.add_item_to_cart(store.item_stored[:oranges])
cart.add_item_to_cart(store.item_stored[:grapes])
cart.add_item_to_cart(store.item_stored[:banana])
cart.add_item_to_cart(store.item_stored[:watermelon])
p Cost.calculate_cost(cart.item_list, store.item_stored)
#cart.show_cart(store.item_stored)