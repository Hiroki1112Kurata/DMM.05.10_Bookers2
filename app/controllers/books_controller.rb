class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book =Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id), notice:'You have created book successfully.'
  end

  def index
    @books = Book.all
    @bookn = Book.new
    @user = current_user
  end

  def show
    @bookn = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
     if @book.user_id == current_user.id

     else
      redirect_to users_path
     end
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id), notice:'You have updated book successfully.'
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
