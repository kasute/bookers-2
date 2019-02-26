class BooksController < ApplicationController

 def new
 end
 
 def index
     @user =current_user
     @book =Book.new
     @books = Book.all
     
 end
 
 def show
   @user= User.new
    @book= Book.new
    @books= Book.find(params[:id])
end
 
 def create
     @book =Book.new(book_params)
     @book.user = current_user
     if  @book.save
      redirect_to book_path(@book)
    else
     @books =Book.all
     @user =current_user
      render action: :index
     end
 end
  def edit
   @book =Book.find(params[:id])
  end
  
  def update
   book=Book.find(params[:id])
   book.update(book_params)
    flash[:notice] = "Book was successfully updated."
    redirect_to book_path(book)
  end
  
   def destroy
     book = Book.find(params[:id])
      book.destroy
      redirect_to books_path
   end
     
 private
  def book_params
  params.require(:book).permit(:title, :body, :name, :introduction)
  end
end