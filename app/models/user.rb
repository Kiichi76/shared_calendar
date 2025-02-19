class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image

  has_many :personal_calendars, dependent: :destroy

  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :follower

  has_many :relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :followed

  has_many :group_users
  has_many :group, through: :group_users

  has_many :group_calendars
  has_many :group, through: :group_calendars

  has_many :comments
  has_many :favorites

  def follow(user)
    relationships.create(followed_id: user.id)
  end
  
  def unfollow(user)
    relationships.find_by(followed_id: user.id).destroy
  end
  
  def following?(user)
    following.include?(user)
  end
  
end
