module PostsHelper

  def sub_reddits_to_select
    SubReddit.all.collect { |sub_reddit| [sub_reddit.name, sub_reddit.id]}
  end

  def users_to_select
    User.all.collect { |user| [user.name, user.id]}
  end

end
