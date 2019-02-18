class CreateProtocols < ActiveRecord::Migration[5.2]
  def change
    create_table :protocols do |t|
      # 以下の記述は菊池氏の作業が終わり次第戻す
      # t.references :affiliation, foreign_key: true
      t.integer :affiliation_id, null: false, default: 0
      # t.references :user, foreign_key: true
      t.integer :user_id, null: false, default: 0
      t.integer :status, null: false, default: 0
      t.integer :parent_id, null: false, default: 0
      t.string :title, null: false, default: ""

      t.timestamps
    end
  end
end
