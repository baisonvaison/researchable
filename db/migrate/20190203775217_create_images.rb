class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.references :experiment, foreign_key: true
      t.string :image, null: false, default:""

      t.timestamps
    end
  end
end
