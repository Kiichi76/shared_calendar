class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image

  has_many :personal_calendars, dependent: :destroy

  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followings, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  has_many :group_users, dependent: :destroy
  has_many :groups, through: :group_users

  has_many :group_calendars, dependent: :destroy
  has_many :gc_groups, class_name: "Group", through: :group_calendars

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many :permits, dependent: :destroy

  def follow(user)
    active_relationships.create(followed_id: user.id)
  end
  
  def unfollow(user)
    active_relationships.find_by(followed_id: user.id).destroy
  end
  
  def following?(user)
    followings.include?(user)
  end

  def followers?(user)
    followers.include?(user)
  end

  def self.looks(range, word)
    if range == "ユーザーID"
      @user = User.where(id: word.to_i)
    else
      @user = User.where("handle LIKE?", "#{word}")
    end
  end
end
