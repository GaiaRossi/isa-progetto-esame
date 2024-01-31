class User < ApplicationRecord
    has_secure_password :password
    has_many :project_assignment
    has_many :projects, :through => :project_assignment
    validates :username, :password, presence: true
    validates :username, uniqueness: true
end
