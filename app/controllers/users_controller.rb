class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books.all
  end

  def index
    @users = User.all
  end

  def edit

  end
end
