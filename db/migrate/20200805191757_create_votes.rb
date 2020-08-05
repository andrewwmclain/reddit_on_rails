class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :link_id
      t.boolean :up

      t.timestamps
    end
  end
end
