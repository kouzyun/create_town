class RelationshipsController < ApplicationController
	before_action :authenticate_user!

	def create
		current_user.following(params[:user_id])
		redirect_to request.referer
	end

	def destroy
		current_user.unfollow(params[:user_id])
		redirect_to request.referer
	end

	def follower
		user = User.find(params[:user_id])
   		@users = user.following_user.page(params[:page])
	end

	def followed
		user = User.find(params[:user_id])
    	@users = user.follower_user.page(params[:page])
	end
end
