class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_post, only: [:edit, :update]
  before_action :correct_status, only: [:new, :create, :edit, :update, :destroy]
  def index
    @posts = Post.page(params[:page]).order(created_at: :desc)
    #いいね数の多い投稿トップ3を表示する()
    @all_ranks = Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
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

  def search
    @posts = Post.search(params[:search])
    @posts = Post.search(params[:search]).page(params[:page])
  end

  private

  def correct_post
    post = Post.find(params[:id])
    if post.user != current_user
      redirect_to posts_path
    end
  end

  def correct_status
    if current_user.user_status_before_type_cast != 1
      redirect_to posts_path
    end
  end

  def post_params
  	params.require(:post).permit(:user_id, :title, :body, :image, :postal_code, :address, :latitude, :longitude)
  end
end
