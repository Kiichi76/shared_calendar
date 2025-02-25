class GroupCalendar < ApplicationRecord
    belongs_to :user
    belongs_to :group
    has_many :comments
    has_many :favorites

    validates :title, presence: true

    def favorited_by?(user)
        favorites.exists?(user_id: user.id)
    end
end
