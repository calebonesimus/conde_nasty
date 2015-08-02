class ProfilesController < ApplicationController
  def show
    @user = User.find_by "username = ?", params[:username]
    @upvotes = @user.up_votes
    @downvotes = @user.down_votes

  end
end
