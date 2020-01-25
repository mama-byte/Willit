class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.boolean :is_executor
      t.string :first_name
      t.string :last_name
      t.string :relationship
      t.string :email
      t.string :release_code
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
