class CommentsController < ApplicationController
  def create
    @comment = Comment.create(content: params[:content], note_id: params[:note_id], user_id: current_user.id)
    redirect_to note_path(@comment.note.id)
  end

  private
  def comment_params
    params.permit(:content, :note_id)
  end
end
