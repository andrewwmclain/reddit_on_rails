class AddAvatarToLinks < ActiveRecord::Migration[5.2]
  def change
    add_column :links, :avatar, :string
  end
end
