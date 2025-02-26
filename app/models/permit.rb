class Permit < ApplicationRecord
    belongs_to :user
    belongs_to :group

    def name(id)
        user = User.find(id)
        user.handle
    end
end
