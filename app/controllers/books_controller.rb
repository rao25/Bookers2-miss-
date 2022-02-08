class BooksController < ApplicationController
  def index
    @book = Book.new
    @books= Book.all
    @user = current_user
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to "/"
  end
  
  def show
    @book = Book.find(params[:id])
    @user = current_user
  end
  
  def edit
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to book_path
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body, :image, :caption)
  end
end