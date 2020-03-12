class CreateTeams < ActiveRecord::Migration[6.0]
  has_many :users
  def change
    create_table :teams do |t|
      t.string :name
      t.string :notes
      # t.type :column_name
    end
  end
end
