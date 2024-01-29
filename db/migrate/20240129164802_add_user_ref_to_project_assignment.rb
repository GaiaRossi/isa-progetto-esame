class AddUserRefToProjectAssignment < ActiveRecord::Migration[7.1]
  def change
    add_reference :project_assignments, :user, null: false, foreign_key: true
  end
end
