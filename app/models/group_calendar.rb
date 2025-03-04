class GroupCalendar < ApplicationRecord
    belongs_to :user
    belongs_to :group
    has_many :comments, dependent: :destroy
    has_many :favorites, dependent: :destroy
    has_many :tags, dependent: :destroy

    validates :title, presence: true

    has_one_attached :image

    def favorited_by?(user)
        favorites.exists?(user_id: user.id)
    end
end
