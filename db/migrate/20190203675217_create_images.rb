class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :image, null: false, default:""
      t.references :experiment, foreign_key: true
      t.timestamps
    end
  end
end
