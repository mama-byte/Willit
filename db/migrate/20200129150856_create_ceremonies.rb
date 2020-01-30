class CreateCeremonies < ActiveRecord::Migration[5.2]
  def change
    create_table :ceremonies do |t|
      t.string :ceremony_type
      t.string :venue
      t.string :burial_type
      t.string :details
      t.string :speaker
      t.string :epitaph
      t.string :music_selector
      t.string :funeral_home
      t.string :press_release
      t.references :user, foreign_key: true
      t.references :contact, foreign_key: true

      t.timestamps
    end
  end
end
