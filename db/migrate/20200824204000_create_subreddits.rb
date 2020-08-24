class CreateSubreddits < ActiveRecord::Migration[5.2]
  def change
    create_table :subreddits do |t|
      t.timestamps
    end
  end
end
