Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    member do
      post 'vote_up'
      post 'vote_down'
      get 'go_to_url'
    end
  end

  post 'must_sign_in' => 'posts#must_sign_in', as: :must_sign_in



  get 'hot_reddit' => 'sub_reddits#hot_reddit', as: :hot_reddit
  get 'nasty_reddit' => 'sub_reddits#nasty_reddit', as: :nasty_reddit
  root 'sub_reddits#hot_reddit'
end
