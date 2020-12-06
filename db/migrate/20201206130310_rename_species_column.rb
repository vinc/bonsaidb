class RenameSpeciesColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :species, :name, :botanical_name
  end
end
