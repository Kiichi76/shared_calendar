class Comment < ApplicationRecord
    belongs_to :group_calendar
    belongs_to :user

    validates :comment, present: true
end
