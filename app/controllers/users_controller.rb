class UsersController < ApplicationController
  before_action :set_user, only: [:show, :comments, :edits]
  before_action :set_edits, only: [:show, :edits]
  before_action :set_comments, only: [:show, :comments]

  def show
  end

  private

  def set_user
    @user = User.friendly.find(params[:id])
  end

  def set_edits
    @edits = PaperTrail::Version.where(whodunnit: @user.id).order(created_at: :desc).page(params['page']).per(50)
  end

  def set_comments
    @comments = @user.comments.page(params['page']).per(50)
  end
end
