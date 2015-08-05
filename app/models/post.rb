class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :sub_reddit

  has_many :up_votes
  has_many :down_votes

  has_many :comments, as: :commentable

  def final_votes
    self.up_votes.count - self.down_votes.count
  end

  def comment_count
    comment_count = self.comments.count
    self.comments.each do |comment|
      if comment.comments.nil?
        comment_count
      else
        comment_count += comment.comments.count
      end
    end
    comment_count
  end

end
