class CreateLabelObjectiveJoinTable < ActiveRecord::Migration
  def change
    create_table :labels_objectives, :id => false do |t|
      t.integer :label_id
      t.integer :objective_id
    end
  end
end
