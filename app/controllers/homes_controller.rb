class HomesController < ApplicationController
	def index
		if user_signed_in?
			@folders = current_user.folders.order("name desc")
			@cabinets = current_user.cabinets.order("uploaded_file_file_name desc")       
		end
	end
end