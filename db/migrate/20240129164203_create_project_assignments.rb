class CreateProjectAssignments < ActiveRecord::Migration[7.1]
  def change
    create_table :project_assignments do |t|

      t.timestamps
    end
  end
end
