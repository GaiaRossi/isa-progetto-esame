class User < ApplicationRecord
    has_secure_password :password
    has_many :projects, :through => :project_assignment
end
