class AddDatesToObjectives < ActiveRecord::Migration
  def change
    add_column :objectives, :week, :integer

    add_column :objectives, :year, :integer

  end
end
