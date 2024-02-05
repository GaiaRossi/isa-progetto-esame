class Project < ApplicationRecord
    has_many :tasks, dependent: :delete_all
    has_many :project_assignment, dependent: :delete_all
    has_many :user, :through => :project_assignment
    validates :name, presence: true, uniqueness: true
    scope :assigned_to, -> (user) {
        joins(:user)
        .where("user_id = ?", user.id)
    }
end
