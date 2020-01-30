class CreateValuables < ActiveRecord::Migration[5.2]
  def change
    create_table :valuables do |t|
      t.string :title
      t.string :image_url
      t.integer :value
      t.string :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
