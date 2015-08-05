class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :password, length: {minimum: 5, maximum: 120}, on: :update, allow_blank: true

  has_many :up_votes, :dependent => :destroy
  has_many :down_votes, :dependent => :destroy

  has_many :posts, :dependent => :destroy
  has_many :comments, :dependent => :destroy

end
