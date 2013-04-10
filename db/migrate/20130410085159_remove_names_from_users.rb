class RemoveNamesFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :firstname
        remove_column :users, :lastname
        remove_column :users, :pseudonym
      end

  def down
    add_column :users, :pseudonym, :string
    add_column :users, :lastname, :string
    add_column :users, :firstname, :string
  end
end
