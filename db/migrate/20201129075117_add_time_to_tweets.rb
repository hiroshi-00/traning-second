class AddTimeToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :time, :integer
  end
end
