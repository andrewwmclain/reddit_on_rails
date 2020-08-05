class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|

      t.text        :message
      t.integer     :user_id
      t.integer     :link_id
      t.datetime  :created_at
      t.datetime  :updated_at

      t.timestamps
    end
  end
end
