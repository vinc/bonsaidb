class CommentsController < ApplicationController
  before_action :set_commentable
  before_action :authenticate_user!

  def create
    @commentable.comments.build(comment_params.merge(user: current_user))
    @commentable.save
    redirect_to @commentable
  end

  private

  def comment_params
    params.require(:comment).permit(%i[body])
  end

  def set_commentable
    if params[:species_id]
      @commentable = Species.friendly.find(params[:species_id])
    end
  end
end
