class Task < ApplicationRecord
    belongs_to :project

    scope :visible_to, -> (user){
        joins(:project => :user)
        .where("user_id = ?", user.id)
    }
end
