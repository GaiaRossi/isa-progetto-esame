class Task < ApplicationRecord
    belongs_to :project
    validates :name, :project_id, presence: true
    validates :name, uniqueness: true

    scope :visible_to, -> (user){
        joins(:project => :user)
        .where("user_id = ?", user.id)
    }
end
