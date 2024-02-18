class User < ApplicationRecord
    has_secure_password :password
    has_many :project_assignment, dependent: :delete_all
    has_many :projects, :through => :project_assignment
    validates :username, :password, presence: true
    validates :is_admin, inclusion: [true, false]
    validates :username, uniqueness: true
end
