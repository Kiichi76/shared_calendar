class GroupUser < ApplicationRecord
    belongs_to :user
    belongs_to :group

    def members(id)
        users = User.find(id)
        users.handle
    end
end
