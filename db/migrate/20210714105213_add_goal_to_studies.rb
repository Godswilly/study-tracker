class AddGoalToStudies < ActiveRecord::Migration[6.0]
  def change
    add_column :studies, :goal, :integer
  end
end
