class RemoveNameFromStudies < ActiveRecord::Migration[6.0]
  def change
    remove_column :studies, :name, :string
  end
end
