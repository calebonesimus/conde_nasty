class ProfilesController < ApplicationController
  before_action :set_user

  def show
    @posts = @user.posts
    @comments = @user.comments
    @upvotes = @user.up_votes.collect {|upvote| upvote.post}
    @downvotes = @user.down_votes.collect {|downvote| downvote.post}
  end

  private

  def set_user
    if params[:username] == "self"
      @user = current_user
    else
      @user = User.find_by "username = ?", params[:username]
    end
  end

end
