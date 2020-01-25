class CreateMemories < ActiveRecord::Migration[5.2]
  def change
    create_table :memories do |t|
      t.string :image_url
      t.string :audio_url
      t.string :title
      t.string :video_url
      t.string :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
