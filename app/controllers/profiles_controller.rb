class ProfilesController < ApplicationController
  def show
    @user = User.find_by "username = ?", params[:username]
  end

  def upvotes
    @user = User.find_by "username = ?", params[:username]
    @upvotes = @user.up_votes
    @posts = @upvotes.collect { |upvote| upvote.post }
  end

  def downvotes
    @user = User.find_by "username = ?", params[:username]
    @down_votes = @user.down_votes
    @posts = @down_votes.collect { |downvote| downvote.post }
  end

end
