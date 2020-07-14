class UsersController < ApplicationController
	before_action :authenticate_user!
  def index
    @users = User.page(params[:page]).per(10).reverse_order
  end

  def show
  	@user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).reverse_order
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	@user.update(user_params)
  	redirect_to user_path(@user)
  end

  private

  def user_params
  	params.require(:user).permit(:last_name, :first_name, :introduction, :user_status, :profile_image, :affiliation, :job, :interest, :person, :postal_code, :address)
  end
end
