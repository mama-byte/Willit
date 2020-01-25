class CreateContactMemories < ActiveRecord::Migration[5.2]
  def change
    create_table :contact_memories do |t|
      t.references :contact, foreign_key: true
      t.references :memory, foreign_key: true

      t.timestamps
    end
  end
end
