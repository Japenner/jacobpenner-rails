class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :external_key, null: false, unique: true
      t.string :first_name
      t.string :last_name
      t.references :contact_info, null: false, foreign_key: true
      t.references :curriculum_vitae, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
