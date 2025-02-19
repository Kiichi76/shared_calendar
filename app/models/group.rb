class Group < ApplicationRecord
    has_many :group_users
    belongs_to :owner, class_name: "User"
    has_many :users, through: :group_users, source: :user
    has_many :group_calendars
    has_many :users, through: :group_calendars

    has_one_attached :group_image

    validates :name, presence: true
    def include_user?(user)
        group_users.exists?(user_id: user.id)
    end

    def self.looks(range, word)
        if range == "グループID"
          @group = Group.where(id: word.to_i)
        else
          @group = Group.where("name LIKE?", "#{word}")
        end
    end
end
