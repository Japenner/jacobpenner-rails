class CreateAchievements < ActiveRecord::Migration[6.0]
  def change
    create_table :achievements do |t|
      t.string :value
      t.references :employment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
