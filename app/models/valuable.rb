class Valuable < ApplicationRecord
  belongs_to :user

  has_many :contact_valuables
  has_many :contacts, through: :contact_valuables
end
