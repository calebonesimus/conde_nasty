Rails.application.routes.draw do
  resources :posts do
    member do
      post 'vote_up'
    end

    member do
      post 'vote_down'
    end
  end

  # get 'posts/:id/vote_up' => 'posts#vote_up', as: :vote_up
  # get 'posts/:id/vote_down' => 'posts#vote_down', as: :vote_down



  get 'hot_reddit' => 'sub_reddits#hot_reddit', as: :hot_reddit
  get 'nasty_reddit' => 'sub_reddits#nasty_reddit', as: :nasty_reddit
  root 'sub_reddits#hot_reddit'
end
