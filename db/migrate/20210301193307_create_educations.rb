class CreateEducations < ActiveRecord::Migration[6.0]
  def change
    create_table :educations do |t|
      t.string :external_key, null: false, unique: true
      t.references :organization, null: false, foreign_key: true
      t.references :curriculum_vitae, null: false, foreign_key: true

      t.timestamps
    end
  end
end
