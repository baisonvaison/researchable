class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :category, null: false, default: ""
      t.references :experiment, foreign_key: true
      t.timestamps
    end
  end
end
