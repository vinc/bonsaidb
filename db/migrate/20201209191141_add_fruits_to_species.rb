class AddFruitsToSpecies < ActiveRecord::Migration[6.0]
  def change
    add_column :species, :fruits, :boolean
  end
end
