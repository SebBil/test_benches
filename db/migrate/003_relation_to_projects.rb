class RelationToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :benches, :project_id, :string
  end
end
