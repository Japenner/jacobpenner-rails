class CreateSocialMediaAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :social_media_accounts do |t|
      t.references :social_media, null: false, foreign_key: true
      t.references :profile, null: false, foreign_key: true
      t.string :link

      t.timestamps
    end
  end
end
