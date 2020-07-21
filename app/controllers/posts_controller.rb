class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_post, only: [:edit, :update]
  #showページの閲覧数をカウントする
  impressionist :actions=> [:show]

  def index
    @posts = Post.page(params[:page])
    #いいね数の多い投稿トップ3を表示する()
    @all_ranks = Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    impressionist(@post, nil)
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
    @posts = Post.all.page(params[:page]).search(params[:search])
  end

  private

  def correct_post
    post = Post.find(params[:id])
    if post.user != current_user
      redirect_to posts_path
    end
  end
  
  def post_params
  	params.require(:post).permit(:user_id, :title, :body, :image, :postal_code, :address, :latitude, :longitude)
  end
end
