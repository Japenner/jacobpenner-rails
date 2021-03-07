class CreateOrganizations < ActiveRecord::Migration[6.0]
  def change
    create_table :organizations do |t|
      t.string :external_key, null: false, unique: true
      t.references :contact_info, null: false, foreign_key: true
      t.string :name
      t.references :organization_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
