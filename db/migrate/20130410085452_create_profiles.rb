class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
    	t.string :pseudo
    	t.string :firstname
    	t.string :lastname
    	t.date :birthday
    	t.integer :user_id

      t.timestamps
    end
  end
end
