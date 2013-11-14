module ProductsHelper
	def format_price(price_in_cents)
		price=price_in_cents.to_f/100
		sprintf("%.2f", price)
	end
end
