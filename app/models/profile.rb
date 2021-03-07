class Profile < ApplicationRecord
  belongs_to :contact_info
  belongs_to :curriculum_vitae
  belongs_to :user

  has_many :social_media_accounts

  before_save :set_external_key

  def set_external_key
    self.external_key = "PROID#{SecureRandom.alphanumeric(11).upcase}"
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
