class CommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		@post = Post.find(params[:post_id])
		@comment = Comment.new(comment_params)
		@comment.user_id = current_user.id
		@comment.post_id = @post.id
		@comment.save
		redirect_to post_path(post)
	end

	def destroy
		@post = Post.find(params[:post_id])
		comment = @post.comments.find(params[:id])
		comment.destroy
    	redirect_to post_path(params[:post_id])
	end

	private

	def comment_params
	    params.require(:comment).permit(:content)
	end

end

