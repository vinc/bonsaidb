class AddFlowersToSpecies < ActiveRecord::Migration[6.0]
  def change
    add_column :species, :flowers, :boolean
  end
end
