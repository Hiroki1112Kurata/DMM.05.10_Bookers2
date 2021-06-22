class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books.all
  end

  def index
    @user = User.find(params[:id])
  end

  def edit

  end
end
