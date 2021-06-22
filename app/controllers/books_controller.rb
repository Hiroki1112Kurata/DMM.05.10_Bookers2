class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book =Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
    # ★book showページへ移動
  end

  def index
    @books = Book.all
    @bookn = Book.new
    @user = User.find_by id: current_user.id
  end

  def show
    @bookn = Book.new
    @book = Book.find(params[:id])
    @user = User.find_by id: @book.user_id
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    
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
