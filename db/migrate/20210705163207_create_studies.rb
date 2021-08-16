class CreateStudies < ActiveRecord::Migration[6.0]
  def change
    create_table :studies do |t|
      t.string :name
      t.integer :hours
      t.integer :hours_goal
      t.integer :projects
      t.integer :projects_goal
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
