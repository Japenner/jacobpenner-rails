class Education < ApplicationRecord
  belongs_to :organization
  belongs_to :curriculum_vitae

  before_save :set_external_key

  def set_external_key
    self.external_key = "EDUID#{SecureRandom.alphanumeric(11).upcase}"
  end
end
