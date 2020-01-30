class Contact < ApplicationRecord
  belongs_to :user

  has_many :contact_valuables
  has_many :valuables, through: :contact_valuables
end
