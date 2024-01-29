class Project < ApplicationRecord
    has_many :tasks
    has_many :user, :through => :project_assignment
end
