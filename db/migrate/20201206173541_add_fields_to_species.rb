class AddFieldsToSpecies < ActiveRecord::Migration[6.0]
  def change
    add_column :species, :description, :text
    add_column :species, :location, :text
    add_column :species, :watering, :text
    add_column :species, :feeding, :text
    add_column :species, :repotting, :text
    add_column :species, :pruning, :text
    add_column :species, :pinching, :text
    add_column :species, :wiring, :text
  end
end
