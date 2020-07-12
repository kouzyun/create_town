class UsersController < ApplicationController
	before_action :authenticate_user!
  def index
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	@user.update(user_params)
  	redirect_to user_path(@user)
  end

  def user_params
  	params.require(:user).permit(:last_name, :first_name, :introduction, :user_status, :profile_imade, :affiliation, :job, :interest, :person, :postal_code, :address)
  end
end
