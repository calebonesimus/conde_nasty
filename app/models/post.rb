class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :sub_reddit

  has_many :up_votes
  has_many :down_votes
  has_many :comments

  def final_votes
    self.up_votes.count - self.down_votes.count
  end

end
