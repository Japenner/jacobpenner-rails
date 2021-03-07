class CreateEmploymentsSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :employments_skills, id: false do |t|
      t.references :employment, null: false, foreign_key: true
      t.references :skill, null: false, foreign_key: true

      t.timestamps
    end

    add_index :employments_skills, %i[employment_id skill_id], unique: true
  end
end
