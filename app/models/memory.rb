class Memory < ApplicationRecord
  belongs_to :user

  has_many :contact_memories
  has_many :contacts, through: :contact_memories
end
