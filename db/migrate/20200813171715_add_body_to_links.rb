class AddBodyToLinks < ActiveRecord::Migration[5.2]
  def change
    add_column :links, :body, :text
  end
end
