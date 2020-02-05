class Ceremony < ApplicationRecord
  enum burial_type: { burial: 0, cremation: 1, space_burial: 2, tree_planting: 3,
                      cryonics: 4, memorial_diamond: 5, vinyl_press: 6, donation: 7, sky_burial: 8 }

  enum ceremony_type: { funeral: 0, memorial: 1, life_celebration: 2, wake: 3,
                        grave_side: 4, scattering: 5 }

  belongs_to :user
  belongs_to :speaker, class_name: 'Contact', foreign_key: 'speaker_id'
  belongs_to :music_selector, class_name: 'Contact', foreign_key: 'music_selector_id'
end
