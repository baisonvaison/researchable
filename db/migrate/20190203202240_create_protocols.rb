class CreateProtocols < ActiveRecord::Migration[5.2]
  def change
    create_table :protocols do |t|
      t.references :affiliation, foreign_key: true
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.integer :status, null: false, default: 0
      t.integer :parent_id, null: false, default: 0
      t.string :title, null: false, default: ""

      t.timestamps
    end
  end
end
