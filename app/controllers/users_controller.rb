class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    set_partial
  end

  def create
    @user = User.new(user_params)
    set_partial
    if @user.save
      redirect_to edit_user_path(@user), method: :get
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    set_partial
    render 'new'
  end

  def update
    @user = User.find(params[:id])
    set_partial
    if @user.update_attributes(user_params) && helpers.form3_empty?(@user)
      redirect_to edit_user_path(@user)
    elsif @user.update_attributes(user_params)
      redirect_to user_path(@user)
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

  def set_partial
    if helpers.form1_empty?(@user)
      @partial = 'form1'
    elsif helpers.form2_empty?(@user)
      @partial = 'form2'
    else
      @partial = 'form3'
    end
  end
end
