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

  get 'r/:reddit' => 'sub_reddits#show', as: :subreddit
  root 'sub_reddits#show'
end
