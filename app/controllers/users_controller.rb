class UsersController < ApplicationController

  before_action :set_user, only: [:show, :update, :edit]
  # before_action :authenticate_user!
  # skip_before_action :authenticate_user!, only: :index

  def index
   @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @comment = Comment.new
  end

  def edit
  end

# PATCH/PUT /user/1.json
  def update

    if @user.update(user_params)
      flash[:notice] = "Your user info was updated."
      redirect_to user_path(@user)
    else
      flash[:notice] = "Oops something went wrong."
      render :show
    end
  end


  private

  def user_params
      params.require(:user).permit(:first_name, :last_name)
    end

  def set_user
    @user = User.find(params[:id])
  end



end
