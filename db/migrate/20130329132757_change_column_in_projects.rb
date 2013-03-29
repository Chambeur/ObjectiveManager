class ChangeColumnInProjects < ActiveRecord::Migration
  def up
  	rename_column :projects, :title, :name
  end

  def down
  end
end
