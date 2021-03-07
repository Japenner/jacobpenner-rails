class CreateSocialMedia < ActiveRecord::Migration[6.0]
  def change
    create_table :social_media do |t|
      t.string :name
      t.string :site
      t.string :external_key, null: false, unique: true

      t.timestamps
    end
  end
end
