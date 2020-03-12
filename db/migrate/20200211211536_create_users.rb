class CreateUsers < ActiveRecord::Migration[6.0]
  belongs_to :team, optional: true

  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      # t.type :column_name
    end
  end
end
