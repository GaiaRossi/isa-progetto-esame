class Task < ApplicationRecord
    belongs_to :project
    validates :name, :project_id, presence: true
    validates :name, uniqueness: true

    scope :visible_to, -> (user){
        joins(:project => :user)
        .where("user_id = ?", user.id)
    }

    scope :not_completed, -> {
        where("is_completed = ?", false)
    }

    scope :completed, -> {
        where("is_completed = ?", true)
    }
end
