require "open-uri"

class ProductsController < ApplicationController
	def index
		products_json = open('http://lcboapi.com/products').read
		@products = JSON.parse(products_json)
	end

	def show
		product_json = open("http://lcboapi.com/products/#{params["id"]}").read

		@product = JSON.parse(product_json)['result']
		@stores_all=[]
		stores_json = open("http://lcboapi.com/products/#{params["id"]}/stores").read
		@stores=JSON.parse(stores_json)['result']
		@stores.each do |store|
			@stores_all << store
		end


	end
end
