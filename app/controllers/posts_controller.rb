class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_post, only: [:edit, :update]

  def index
    @posts = Post.page(params[:page]).reverse_order
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)
    @post.user_id = current_user.id
  	if @post.save
      flash[:success] = "新規投稿が完了しました。"
  	 redirect_to posts_path
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "投稿内容が変更されました。"
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  private

  def correct_post
    post = Post.find(params[:id])
    if post.user != current_user
      redirect_to posts_path
    end
  end
  
  def post_params
  	params.require(:post).permit(:user_id, :title, :body, :image, :category, :postal_code, :address, :latitude, :longitude)
  end
end
