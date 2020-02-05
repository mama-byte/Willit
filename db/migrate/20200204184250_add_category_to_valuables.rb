class AddCategoryToValuables < ActiveRecord::Migration[5.2]
  def change
    add_column :valuables, :category, :string
  end
end
