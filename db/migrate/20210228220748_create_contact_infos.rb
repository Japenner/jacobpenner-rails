class CreateContactInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :contact_infos do |t|
      t.references :address, null: false, foreign_key: true
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
