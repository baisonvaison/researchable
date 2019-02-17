class AddCordToAffiliations < ActiveRecord::Migration[5.2]
  def change
    add_column :affiliations, :cord, :string, null: false
  end
end
