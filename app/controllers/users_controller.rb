class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books.all
    @book = Book.new
  end

  def index
    @users = User.all
    @bookn = Book.new
    @user = User.find_by id: current_user.id
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
      
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
