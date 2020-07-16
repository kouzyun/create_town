class CommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		post = Post.find(params[:post_id])
		comment = Comment.new(comment_params)
		comment.user_id = current_user.id
		comment.post_id = post.id
		comment.save
		redirect_to post_path(post)
	end

	def destroy
	end

	

end

