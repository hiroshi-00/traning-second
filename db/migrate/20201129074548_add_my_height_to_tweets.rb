class AddMyHeightToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :my_height, :integer
    add_column :tweets, :my_weight, :integer
  end
end
