class AddPhotoToValuables < ActiveRecord::Migration[5.2]
  def change
    add_column :valuables, :photo, :string
  end
end
