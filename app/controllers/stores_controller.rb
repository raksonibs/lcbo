require "open-uri"

class StoresController < ApplicationController
	before_filter :load_stores
	
	def index
		if params['product_id']
			product_stores_json = open("http://lcboapi.com/products/#{params["product_id"]}/stores?per_page=50").read
			@stores= JSON.parse(product_stores_json)['result']
			@stores.each do |store| 
				Location.create(address:store['address_line_1'])
			end

			@cat=true
		else
			#populate databse each time, wouldn't it be better to populate 
			#once and then just look up, so get all stores by address
			stores_json = open("http://lcboapi.com/stores").read
			@stores=JSON.parse(stores_json)['result']
			@stores.each do |store| 
				Location.create(address:store['address_line_1'])
			end

			@cat=false
		end
	end

	def show
	end

    private
    def load_stores
    end
end


=begin
Queens Quay & Yonge
Yonge & Summerhill
Rideau & King Edward
Bayfield & Hanmer
Hwy 7 & Weston
Hwy 401 & Weston
Bayview & Sheppard
Eglinton & Laird
Cornwall & Trafalgar
Scottsdale & Stone Road West
King S. & William
Winston Churchill & Aquitaine / Battleford
Dundas & Trafalgar
King North & Northfield
Bank & Walkley
Yonge & Davis
Innes & Tenth Line
Bloor & Royal York
Carling & Woodroffe
Bayview & St John
=end