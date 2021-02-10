class BooksController < ApplicationController
  def welcome
  end

  def index
    @book = Book.new
    @books = Book.all

  end

  def create
    @books = Book.all
    @book = Book.new(book_params)
    @book.save
    if @book.save
      redirect_to book_path(@book.id), notice: "Books was successfully created."
    else
      render action: :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.update(book_params)
      redirect_to book_path(@book.id), notice: "Books was successfully updated."
    else
      render action: :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path(book)
  end

  private
  def book_params
    params.require(:book).permit(:title,:body)
  end
end
