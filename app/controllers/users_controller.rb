class UsersController < ApplicationController
  
  def index
    @users = User.all
    @user = current_user
    @books = @user.books
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
    render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
  def correct_user
    @book = Book.find(params[:id])
    redirect_to(user_path(current_user.id)) unless @user == current_user
  end
end
