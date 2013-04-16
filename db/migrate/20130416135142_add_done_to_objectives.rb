class AddDoneToObjectives < ActiveRecord::Migration
  def change
    add_column :objectives, :done, :boolean

  end
end
