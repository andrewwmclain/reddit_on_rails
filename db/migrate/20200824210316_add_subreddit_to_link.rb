class AddSubredditToLink < ActiveRecord::Migration[5.2]
  def change
    add_column :links, :subreddit_id, :integer
  end
end
