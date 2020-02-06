  class Valuable < ApplicationRecord
  enum category: { electronics: 0, housewares: 1, jewelry: 2, vehicles: 3, collections: 4}

  enum item: { instruments: 0, books: 1, coins: 2, vinyls: 3, games: 4, miles: 5,
    computer: 6, phone: 7, camera: 8, television: 9, game_console: 10,
    stereo: 11, furniture: 12, appliance: 13, artwork: 14, antiques: 15, clothing: 16,
    kitchenwares: 17, rings: 18, braclets: 19, earings: 20, necklaces: 21,
    watches: 22, cufflinks: 23, cars: 24, bikes: 25, motorbikes: 26, snowboards: 27,
    scooters: 28, boats: 29}

  belongs_to :user

  has_many :contact_valuables
  has_many :contacts, through: :contact_valuables
  mount_uploader :photo, PhotoUploader
end

