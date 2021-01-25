class UsersController < ApplicationController

  def index
    redirect_if_not_logged_in
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    redirect_if_not_logged_in
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
        helpers.log_in @user
        redirect_to user_path(@user)
    else
        @user.errors.full_messages
        render 'new'
    end
  end

  def edit
    redirect_if_not_logged_in
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user == helpers.current_user
       @user.update(user_params)
       redirect_to user_path(@user)
      else
       @user.errors.full_messages
       render 'edit'
      end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to home_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :name)
  end

  

end
