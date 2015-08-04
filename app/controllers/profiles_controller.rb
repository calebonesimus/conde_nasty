class ProfilesController < ApplicationController
  before_action :set_user

  def show
  end

  def posts
    @posts = Post.where(:user_id => current_user.id)
  end

  def comments
    @comments = Comment.where(:user_id => current_user.id)
  end

  def upvotes
    @upvotes = @user.up_votes
    @posts = @upvotes.collect { |upvote| upvote.post }
  end

  def downvotes
    @down_votes = @user.down_votes
    @posts = @down_votes.collect { |downvote| downvote.post }
  end

  private

  def set_user
    @user = User.find_by "username = ?", params[:username]
  end

end
