class AddTeamIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :team_id, :integer
  end
end
#adding team_id column to users
#Establish a one-many relationship between the primary and dependent models:
 
 