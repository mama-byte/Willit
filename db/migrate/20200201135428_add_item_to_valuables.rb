class AddItemToValuables < ActiveRecord::Migration[5.2]
  def change
    add_column :valuables, :item, :integer
  end
end
