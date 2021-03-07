class CreateDegreeDesignations < ActiveRecord::Migration[6.0]
  def change
    create_table :degree_designations do |t|
      t.string :name

      t.timestamps
    end
  end
end
