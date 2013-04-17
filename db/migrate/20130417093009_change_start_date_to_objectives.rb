class ChangeStartDateToObjectives < ActiveRecord::Migration
  def up
    add_column :objectives, :startdate, :date
    remove_column :objectives, :week
    remove_column :objectives, :year
  end

  def down
    add_column :objectives, :week, :integer
    add_column :objectives, :year, :integer
    remove_column :objectives, :startdate
  end
end
