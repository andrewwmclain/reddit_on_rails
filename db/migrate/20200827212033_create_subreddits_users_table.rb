class CreateSubredditsUsersTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :subreddits_users

    create_table :subreddits_users, id: false do |t|
      t.belongs_to :subreddit
      t.belongs_to :user
    end
  end
end
