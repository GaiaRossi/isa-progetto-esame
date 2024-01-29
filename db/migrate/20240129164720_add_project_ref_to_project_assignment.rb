class AddProjectRefToProjectAssignment < ActiveRecord::Migration[7.1]
  def change
    add_reference :project_assignments, :project, null: false, foreign_key: true
  end
end
