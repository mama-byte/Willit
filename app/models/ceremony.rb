class Ceremony < ApplicationRecord
  belongs_to :user

  has_many :contacts, through: :ceremony
end
