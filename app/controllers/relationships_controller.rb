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

	  def follows
	  	
	  end

  def followers
  end
end
