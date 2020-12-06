json.botanical_name species.botanical_name
json.common_names species.common_names.capitalize
json.botanical_group species.botanical_group.humanize
json.extract! species, :created_at, :updated_at
json.url species_url(species, format: :json)
