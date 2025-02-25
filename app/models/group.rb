class Group < ApplicationRecord
  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users
  has_many :group_calendars, dependent: :destroy
  has_many :users, through: :group_calendars
  has_many :permits

  has_one_attached :group_image

  validates :name, presence: true

  def self.looks(range, word)
    if range == "グループID"
        @group = Group.where(id: word.to_i)
    else
        @group = Group.where("name LIKE?", "#{word}")
    end
  end

  def member_count(count)
    count + 1
  end
  
  def group_owner(id)
    user = User.find(id)
    user.handle
  end
end
