class UsersController < ApplicationController
	
  def new
  	@user = User.new
  end
  def create
  	@user = User.new(params[:id])
  	if @user.save
  		redirect_to @user, notice: 'User created'
  	else  		
  		render :action => 'new'
  	end  	
  end
  def show
  	@user=User.find(params[:id])
  end

  private
  def set_user
  	@user = User.find(params[:id])
  end
  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
