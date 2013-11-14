class LocationsController < ApplicationController
	def index
		if params[:search]
			#make you check how many miles wanna check from form
			@locations = Location.near(params[:search], 10)
		end
		@locs={}
		@res=[]
		@locations.each do |location|
			@locs[location.address]=location unless @locs.keys.include? location.address
			@res << "&markers=#{location.latitude}%2C#{location.longitude}"
		end

		@res=@res.join("")

		Location.delete_all
	end
end

