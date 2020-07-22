class UsersController < ApplicationController
	before_action :authenticate_user!
  def index
    @users = User.page(params[:page]).order(created_at: :desc).per(10)
  end

  def show
  	@user = User.find(params[:id])
    @posts = @user.posts.page(params[:page])
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  	 redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def search
    @users = User.search(params[:search])
    @users = User.search(params[:search]).page(params[:page])
  end

  private

  def user_params
  	params.require(:user).permit(:last_name, :first_name, :introduction, :user_status, :profile_image, :affiliation, :job, :interest, :person, :postal_code, :address)
  end
end
