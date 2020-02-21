class Ceremony < ApplicationRecord
  enum burial_type: { "Burial" => 0, "Cremation" => 1, "Space Burial" => 2, "Green" => 3,
                      "Cryonics" => 4, "Diamond" => 5, "Vinyl Press" => 6, "Donation" => 7 }

  enum ceremony_type: { "Funeral" => 0, "Memorial" => 1, "Celebration" => 2, "Wake" => 3,
                        "Graveside" => 4, "Scattering" => 5 }

  belongs_to :user
  belongs_to :speaker, class_name: 'Contact', foreign_key: 'speaker_id'
  belongs_to :music_selector, class_name: 'Contact', foreign_key: 'music_selector_id'
end
