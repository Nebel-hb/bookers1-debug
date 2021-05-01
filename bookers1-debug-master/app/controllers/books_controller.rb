class BooksController < ApplicationController
  def top
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to  book_path(@book)
      
    else
      flash.now[:alert] = 'You have created book error.'
      @books = Book.all
      render 'books/index'
    end
  
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      flash.now[:alert] = 'You have created book error.'
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      flash[:success] = "Book was successfully destroyed."
      redirect_to books_path
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
