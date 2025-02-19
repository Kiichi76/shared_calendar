class Favorite < ApplicationRecord
    belongs_to :user
    belongs_to :group_calendar

    validates :user_id, uniqueness: {scope: :group_calendar_id}
end
