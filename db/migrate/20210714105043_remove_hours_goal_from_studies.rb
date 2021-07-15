class RemoveHoursGoalFromStudies < ActiveRecord::Migration[6.0]
  def change
    remove_column :studies, :hours_goal, :integer
  end
end
