class CreateCurriculumVitaes < ActiveRecord::Migration[6.0]
  def change
    create_table :curriculum_vitaes do |t|
      t.string :description

      t.timestamps
    end
  end
end
