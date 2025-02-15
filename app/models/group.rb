class Group < ApplicationRecord
    has_many :group_users
    belongs_to :owner, class_name: "User"
    has_many :users, through: :group_users

    has_one_attached :group_image

    validates :name, presence: true
end
