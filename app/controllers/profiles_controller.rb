class ProfilesController < ApplicationController
  def show
    @user = User.find_by "username = ?", params[:username]
  end

  def upvotes
    @user = User.find_by "username = ?", params[:username]
    @up_votes = @user.up_votes
  end

  def downvotes
    @user = User.find_by "username = ?", params[:username]
    @down_votes = @user.down_votes
  end

end
