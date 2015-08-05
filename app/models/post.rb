class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :sub_reddit

  has_many :up_votes
  has_many :down_votes

  has_many :comments, as: :commentable

  def final_votes
    self.up_votes.count - self.down_votes.count
  end

  def comment_count(commentable, total=0)
      total += commentable.comments.count
      if commentable.comments
        commentable.comments.each do |comment|
          total += 1
          comment_count(comment, total)
        end
      end
    total
  end


end
