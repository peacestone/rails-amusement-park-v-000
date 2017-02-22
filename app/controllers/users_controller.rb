class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_attributes)
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def new_session
    @user = User.new
  end

  def welcome
  end

  def show
    if logged_in?
      @user = User.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def create_session
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_session_path
    end
  end


  private
    def user_attributes
      params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
    end

end
