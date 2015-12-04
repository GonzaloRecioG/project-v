class CommentsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @comment = Comment.new(comment_params)
    @comment.user = @user
    if @comment.save
      redirect_to user_path(@user)
    else
      render 'users/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
