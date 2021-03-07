class CreateEmployments < ActiveRecord::Migration[6.0]
  def change
    create_table :employments do |t|
      t.references :organization, null: false, foreign_key: true
      t.references :curriculum_vitae, null: false, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date
      t.string :impact
      t.string :external_key, null: false, unique: true

      t.timestamps
    end
  end
end
