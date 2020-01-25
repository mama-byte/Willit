class Contact < ApplicationRecord
  belongs_to :user

  has_many :contact_memories
  has_many :memories, through: :contact_memories
end
