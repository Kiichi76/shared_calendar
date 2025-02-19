class GroupCalendar < ApplicationRecord
    belongs_to :user
    belongs_to :group
    has_many :comments
end
