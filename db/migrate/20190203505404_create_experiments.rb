class CreateExperiments < ActiveRecord::Migration[5.2]
  def change
    create_table :experiments do |t|
      t.string :title, null: false, default: ""
      t.date :date, null: false
      t.text :overview, null: false
      t.text :result, null: false
      t.references :protocol, foreign_key: true
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.references :affiliation, foreign_key: true
      t.string :image, null: false, default: ""

      t.timestamps
    end
  end
end
