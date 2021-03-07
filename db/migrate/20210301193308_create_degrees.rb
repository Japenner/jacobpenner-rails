class CreateDegrees < ActiveRecord::Migration[6.0]
  def change
    create_table :degrees do |t|
      t.string :external_key, null: false, unique: true
      t.datetime :end_date
      t.datetime :start_date
      t.references :degree_concentration, null: false, foreign_key: true
      t.references :degree_type, null: false, foreign_key: true
      t.references :degree_designation, null: false, foreign_key: true
      t.references :education, null: false, foreign_key: true
      t.boolean :was_completed

      t.timestamps
    end
  end
end
