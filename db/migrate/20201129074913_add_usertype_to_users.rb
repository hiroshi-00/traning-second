class AddUsertypeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :usertype, :integer, default: 1
  end
end
