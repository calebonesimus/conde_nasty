class SubRedditsController < ApplicationController

  def hot_reddit
    @posts = SubReddit.find_by("name = ?", "hot_reddit").posts.sort_by do |post|
      post.final_votes
    end.reverse
  end

  def nasty_reddit
    @posts = SubReddit.find_by("name = ?", "nasty_reddit").posts.sort_by do |post|
      post.final_votes
    end.reverse
  end

end
