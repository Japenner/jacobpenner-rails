class CreateResponsibilities < ActiveRecord::Migration[6.0]
  def change
    create_table :responsibilities do |t|
      t.string :value
      t.references :position, null: false, foreign_key: true

      t.timestamps
    end
  end
end
