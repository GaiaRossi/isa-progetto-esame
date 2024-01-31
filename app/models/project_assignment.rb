class ProjectAssignment < ApplicationRecord
    belongs_to :user
    belongs_to :project

    # blocca la coppia user_id e project_id
    validates_uniqueness_of  :user_id, scope: :project_id 
end
