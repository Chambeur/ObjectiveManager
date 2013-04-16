class RemoveStatusFromObjectives < ActiveRecord::Migration
  def up
    remove_column :objectives, :status
      end

  def down
    add_column :objectives, :status, :string
  end
end
