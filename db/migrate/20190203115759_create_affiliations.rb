class CreateAffiliations < ActiveRecord::Migration[5.2]
  def change
    create_table :affiliations do |t|
      t.string :university, null: false, default: ""
      t.string :department, null: false, default: ""
      t.string :course, null: false, default: ""
      t.string :labo, null: false, default: ""
      t.string :password_digest, null: false, default: ""

      t.timestamps
    end

    # 以下の記述は本来はあったほうが良いものの、 "Mysql2::Error: Specified key was too long; max key length is 1000 bytes" が殺しに来るため、いったんは保留。
    # add_index :affiliations, [:university, :department, :course, :labo], unique: true, name: 'affiliations_index'

  end
end
