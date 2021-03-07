class CreateSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :skills do |t|
      t.string :name
      t.references :curriculum_vitae, null: false, foreign_key: true
      t.references :skill_category, null: false, foreign_key: true
      t.decimal :years_experience
      t.decimal :score

      t.timestamps
    end
  end
end
