class Project < ApplicationRecord
    has_many :tasks
    has_many :project_assignment
    has_many :user, :through => :project_assignment
    scope :assigned_to, -> (user) {
        joins(:user)
        .where("user_id = ?", user.id)
    }
end
