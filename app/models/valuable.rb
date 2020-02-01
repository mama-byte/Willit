class Valuable < ApplicationRecord
  enum category: { electronics: 0, housewares: 1, jewelry: 2}

  enum item: { cans: 0, stamps: 1, phones: 2}

  belongs_to :user

  has_many :contact_valuables
  has_many :contacts, through: :contact_valuables
end
