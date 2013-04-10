class CreateTeammembers < ActiveRecord::Migration
  def change
    create_table :teammembers do |t|
      t.boolean :manager
      t.integer :user_id
      t.integer :team_id

      t.timestamps
    end
  end
end
