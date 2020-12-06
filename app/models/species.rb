class Species < ApplicationRecord
  extend FriendlyId

  friendly_id :botanical_name, use: :slugged

  enum botanical_group: [
    :deciduous_broadleaf, :evergreen_broadleaf,
    :deciduous_conifer, :evergreen_conifer,
  ]
end
