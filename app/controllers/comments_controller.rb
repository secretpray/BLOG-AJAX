class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post
  # respond_to :html, :json

  def create
    @comment = @post.comments.new(comment_params) # @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    # @comment.save
    # redirect_back(fallback_location: root_path)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.post, notice: 'Comment was successfully created'}
        format.js
      else
        format.html { redirect_to @comment.post, alert: @comment.errors.full_messages.join(', ') }
        format.js {}
        format.json { render json: @comment.errors, status: :unprocessable_entity }
        # flash[:alert] = @comment.errors.full_messages.join(', ')
      end
    end
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    @post = @comment.post
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id, :user_id)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
