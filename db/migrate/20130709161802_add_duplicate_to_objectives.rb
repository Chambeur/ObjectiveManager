class AddDuplicateToObjectives < ActiveRecord::Migration
  def change
    add_column :objectives, :duplicate, :boolean

  end
end
