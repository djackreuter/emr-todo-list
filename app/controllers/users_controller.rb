class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_after_save
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    render 'new'
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_after_save
    else
      render 'new'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :bio, :city, :state, :zip, :university, :degree, :grad_year)
  end

  def redirect_after_save
    if @user.complete?
      redirect_to user_path(@user)
    else
      redirect_to edit_user_path(@user)
    end
  end
end
