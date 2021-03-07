class Organization < ApplicationRecord
  belongs_to :contact_info
  belongs_to :organization_type

  before_save :set_external_key

  def set_external_key
    self.external_key = "ORGID#{SecureRandom.alphanumeric(11).upcase}"
  end
end
