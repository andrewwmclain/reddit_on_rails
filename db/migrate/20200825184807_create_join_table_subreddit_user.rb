class CreateJoinTableSubredditUser < ActiveRecord::Migration[5.2]
  def change
    create_join_table :subreddits, :users do |t|
      # t.index [:subreddit_id, :user_id]
      # t.index [:user_id, :subreddit_id]
    end
  end
end
