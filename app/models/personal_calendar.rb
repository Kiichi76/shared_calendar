class PersonalCalendar < ApplicationRecord
    validates :title, presence: true
    belongs_to :user
end
