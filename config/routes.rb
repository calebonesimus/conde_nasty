Rails.application.routes.draw do
  get 'hot_reddit' => 'sub_reddits#hot_reddit'
  get 'nasty_reddit' => 'sub_reddits#nasty_reddit'
  root 'sub_reddits#hot_reddit'
end
