class AddColumnsToSubreddit < ActiveRecord::Migration[5.2]
  def change
    add_column :subreddits, :name, :string
  end
end
