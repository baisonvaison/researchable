class CreateExperiments < ActiveRecord::Migration[5.2]
  def change
    create_table :experiments do |t|
      t.string :title, null: false, default: ""
      t.date :date, null: false
      t.text :overview, null: false
      t.text :result, null: false
      t.references :experiment, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
