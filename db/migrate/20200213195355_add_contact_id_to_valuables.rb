class AddContactIdToValuables < ActiveRecord::Migration[5.2]
  def change
    add_reference :valuables, :contact, index: true
  end
end
