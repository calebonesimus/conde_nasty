class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :create_profile

  has_many :up_votes, :dependent => :destroy
  has_many :down_votes, :dependent => :destroy
  has_many :posts, :dependent => :destroy
  has_one :profile

  def create_profile
    Profile.create(:user_id => id)
  end


end
