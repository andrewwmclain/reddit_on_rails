class AddBodyToLinks < ActiveRecord::Migration[5.2]
  def change
    add_column :links, :body, :text_area
  end
end
