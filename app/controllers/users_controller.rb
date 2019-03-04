class UsersController < ApplicationController
  
   before_action :authenticate_user!
 
   
  def show
    
    @book= Book.new
    @books= Book.all
    @user= User.find(params[:id])
  end
  
  def create
  
  end
  
  def root
  end

  def index
    @user =current_user
    @book =Book.new
    @user_image = UserImage.new
    @users = User.all
  end
  
  def top
  end
  
  def about
    
  end
  
  def name
  end
  
  def new
  end
  
  def edit
    @user = User.find(params[:id])
   if @user.id!=current_user.id
      redirect_to user_path(@user)
   end
  end 
  
  def update
     @user = User.find(params[:id])
     if @user.update(user_params)

      flash[:notice] = " successfully updated."
      redirect_to user_path
      else
      render 'edit'
      flash[:alert] = '無効なintroduction'
     end
  end
  
  private
   def user_params
     params.require(:user).permit(:username,  :profile_image,:introduction)
   end
  
end
