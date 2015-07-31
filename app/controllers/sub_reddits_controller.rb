class SubRedditsController < ApplicationController

  def hot_reddit
    @posts = SubReddit.find_by("name == ?", "hot_reddit").posts.sort_by do |post|
      post.final_votes
    end.reverse
  end

  def nasty_reddit
    @posts = SubReddit.find_by("name == ?", "nasty_reddit").posts.sort_by do |post|
      post.final_votes
    end.reverse
  end

  # def vote_up(post)
  #   UpVote.create(:post_id => post.id)
  #   redirect_to send("#{post.sub_reddit.name}_path")
  # end
  #
  # def vote_down(post)
  #   DownVote.create(:post_id => post.id)
  #   redirect_to send("#{@post.sub_reddit.name}_path")
  # end

  # helper_method :vote_up, :vote_down

end
