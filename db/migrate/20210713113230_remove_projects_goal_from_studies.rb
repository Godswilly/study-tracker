class RemoveProjectsGoalFromStudies < ActiveRecord::Migration[6.0]
  def change
    remove_column :studies, :projects_goal, :integer
  end
end
