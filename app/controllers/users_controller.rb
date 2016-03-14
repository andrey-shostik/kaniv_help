class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:current_user_id] = @user.token
      redirect_to root_path
    else
      flash[:error] = 'Incorrect Email or Password'
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name)
  end

end
