class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.boolean :autogenerate

      t.timestamps
    end
  end
end
