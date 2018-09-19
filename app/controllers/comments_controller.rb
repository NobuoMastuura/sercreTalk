class CommentsController < ApplicationController
  def create
    @comment = Comment.create(text: comment_params[:text], post_id: comment_params[:talk_id], user_id: current_user.id)
    redirect_to "/talk/#{@comment.post_id}"
  end

  private
  def comment_params
    params.permit(:text, :talk_id)
  end
end
