class SubRedditsController < ApplicationController

  def hot_reddit
    @posts = SubReddit.find_by("name == ?", "hot_reddit").posts.reverse
  end

  def nasty_reddit
    @posts = SubReddit.find_by("name == ?", "nasty_reddit").posts.reverse
  end

end
