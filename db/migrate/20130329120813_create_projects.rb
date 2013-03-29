class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
    	t.string	:title
      t.timestamps
    end

    add_column :objectives, :project_id, :integer
  end
end
