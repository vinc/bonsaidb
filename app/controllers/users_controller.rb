class UsersController < ApplicationController
  def show
    @user = User.friendly.find(params[:id])
    @changes = PaperTrail::Version.where(whodunnit: @user.id)
  end
end
