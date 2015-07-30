Rails.application.routes.draw do
  resources :posts
  
  get 'hot_reddit' => 'sub_reddits#hot_reddit', as: :hot
  get 'nasty_reddit' => 'sub_reddits#nasty_reddit', as: :nasty
  root 'sub_reddits#hot_reddit'
end
