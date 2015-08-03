class SubRedditsController < ApplicationController

  def show
    @subreddit = SubReddit.find_by_name(params[:reddit] || "hot_reddit")
    @posts = @subreddit.posts.sort_by do |post|
      post.final_votes
    end.reverse
  end

end
