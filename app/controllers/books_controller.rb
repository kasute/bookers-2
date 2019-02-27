class BooksController < ApplicationController

 def new
 end
  def ensure_correct_user
    @user = User.find_by(id:params[:id])
    if @user.id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/users/index")
     end
  end
 
 def index
     @user =current_user
     @book =Book.new
     @books = Book.all
     
 end
 
 def show
    @user= current_user
    @book= Book.new
    @books= Book.find(params[:id])
    @users = User.find_by(id:params[:id])
    if @user.id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/users/index")
    end
 end
 
 def create
     @book =Book.new(book_params)
     @book.user_id = current_user.id
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
  params.require(:book).permit(:title, :body, :name)
  end
end