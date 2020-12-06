class AddBotanicalGroupToSpecies < ActiveRecord::Migration[6.0]
  def change
    add_column :species, :botanical_group, :integer
  end
end
