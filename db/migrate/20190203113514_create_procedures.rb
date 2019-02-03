class CreateProcedures < ActiveRecord::Migration[5.2]
  def change
    create_table :procedures do |t|
      t.references :protocol, foreign_key: true
      t.text :text, null: false
      t.integer :position, null: false, default: 0

      t.timestamps
    end
  end
end
