class CommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		@post = Post.find(params[:post_id])
		@comment = Comment.new(comment_params)
		@comment.user_id = current_user.id
		@comment.post_id = @post.id
		@comment.save
		render 'index'
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy
    	render 'index'
	end

	private

	def comment_params
	    params.require(:comment).permit(:content, :post_id, :user_id)
	end

end

