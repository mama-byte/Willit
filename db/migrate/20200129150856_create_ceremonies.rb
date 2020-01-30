class CreateCeremonies < ActiveRecord::Migration[5.2]
  def change
    create_table :ceremonies do |t|
      t.integer :ceremony_type
      t.string :venue
      t.integer :burial_type
      t.string :details
      t.string :epitaph
      t.string :funeral_home
      t.string :press_release
      t.references :user, foreign_key: true
      t.references :speaker, references: :contacts, foreign_key: true
      t.references :music_selector, references: :contacts, foreign_key: true

      t.timestamps
    end
  end
end
