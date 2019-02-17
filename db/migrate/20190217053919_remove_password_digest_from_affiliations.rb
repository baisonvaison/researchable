class RemovePasswordDigestFromAffiliations < ActiveRecord::Migration[5.2]
  def change
    remove_column :affiliations, :password_digest, :string
  end
end
