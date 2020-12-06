class AddSlugToSpecies < ActiveRecord::Migration[6.0]
  def change
    add_column :species, :slug, :string
    add_index :species, :slug, unique: true
  end
end
