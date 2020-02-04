  class Valuable < ApplicationRecord
  enum category: { electronics: 0, household: 1, jewelry: 2, vehicles: 3}

  enum item: { computer: 0, tv: 1, bikes: 2}

  belongs_to :user

  has_many :contact_valuables
  has_many :contacts, through: :contact_valuables
  mount_uploader :photo, PhotoUploader
end
