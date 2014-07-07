class Merchandise

	@@daily_earnings = 0
	@@inventory = 0

	def initialize(type, price, qty_in_stock = 0)
		@type = type
		@price = price
		@qty_in_stock = qty_in_stock
	end

	def new_arrival(qty_arrived)
		@qty_in_stock += qty_arrived
		@@inventory += qty_arrived
	end

	def sold(qty_sold)
		@qty_in_stock -= qty_sold
		@@daily_earnings += @price * qty_sold
		@@inventory -= qty_sold
	end

	def holiday_sale(percentage)
		@price *= percentage
	end

	def Merchandise.report
		"The store's earnings to date are #{@@daily_earnings}. There are #{@@inventory} items left in stock."
	end
end

# Test Code

tshirts = Merchandise.new("tshirts", 19.99)
pants = Merchandise.new("pants", 34.99)

p Merchandise.report # == "The store's earnings to date are 0. There are 0 items left in stock."

tshirts.new_arrival(60)
pants.new_arrival(40)
p Merchandise.report # == "The store's earnings to date are 0. There are 100 items left in stock."

tshirts.sold(2)
pants.sold(1)
p Merchandise.report # == "The store's earnings to date are 74.97. There are 97 items left in stock."

tshirts.holiday_sale(0.50)
tshirts.sold(3)
p Merchandise.report # == "The store's earnings to date are 104.955. There are 94 items left in stock."
