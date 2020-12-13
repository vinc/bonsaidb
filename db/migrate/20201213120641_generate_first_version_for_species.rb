class GenerateFirstVersionForSpecies < ActiveRecord::Migration[6.0]
  def up
    Species.find_each do |species|
      if species.versions.empty?
        species.paper_trail.save_with_version
        version = species.versions.last;
        version.whodunnit = User.first.id
        version.save
      end
    end
  end
end
