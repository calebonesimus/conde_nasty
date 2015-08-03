class ProfilesController < ApplicationController
  def show
    @user = User.find_by "username = ?", params[:username]
  end

  def upvotes
    @user = User.find_by "username = ?", params[:username]
    @up_votes = @user.up_votes

    # Returns array of post objects and removes duplicates
    @posts = @up_votes.collect do |vote|
      vote.post
    end.uniq
  end

  def downvotes
    @user = User.find_by "username = ?", params[:username]
    @down_votes = @user.down_votes

    # Returns array of post objects and removes duplicates
    @posts = @down_votes.collect do |vote|
      vote.post
    end.uniq
  end

end
