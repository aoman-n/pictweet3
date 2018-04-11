class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      respond_to do |format|
        format.html { redirect_to tweet_path(params[:tweet_id]) }
        format.json
      end
      flash[:notice] = 'コメントが送信されました'
    else
       # @tweet = Tweet.find(params[:tweet_id])
       # @comments = @tweet.comments.includes(:user)
      # flash.now[:alert] = 'メッセージを入力してください'
       render 'tweets/show'
     end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(tweet_id: params[:tweet_id], user_id: current_user.id)
  end
end
