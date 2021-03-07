class SocialMedia < ApplicationRecord
  self.table_name = 'social_media'

  before_save :set_external_key

  def set_external_key
    self.external_key = "SOCID#{SecureRandom.alphanumeric(11).upcase}"
  end
end
