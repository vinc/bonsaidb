class Species < ApplicationRecord
  extend FriendlyId

  friendly_id :botanical_name, use: :slugged

  enum botanical_group: %i[deciduous_broadleaf evergreen_broadleaf deciduous_conifer evergreen_conifer]

  has_many :comments, as: :commentable, dependent: :destroy

  has_paper_trail

  def self.text_attributes
    %i[description location watering feeding repotting pruning pinching wiring].freeze
  end

  def title
    botanical_name
  end
end
