Rails.application.routes.draw do

  get 'profiles/:username' => 'profiles#show', as: :view_profile
  get 'profiles/:username/up_votes' => 'profiles#upvotes', as: :up_vote
  get 'profiles/:username/down_votes' => 'profiles#downvotes', as: :down_vote

  devise_for :users, :controllers => {
      :registrations => 'devise/registrations',
      :sessions => 'devise/sessions',
      :passwords => 'devise/passwords',
      :confirmations => 'devise/confirmations',
      :unlocks => 'devise/unlocks'
  }

  resources :posts do
    member do
      post 'vote_up'
      post 'vote_down'
      get 'go_to_url'
    end
    resources :comments, :only => [:index, :show, :create, :update]
  end

  post 'must_sign_in' => 'posts#must_sign_in', as: :must_sign_in

  get 'r/:reddit' => 'sub_reddits#show', as: :subreddit
  root 'sub_reddits#show'

end
