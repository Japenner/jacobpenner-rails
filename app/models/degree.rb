class Degree < ApplicationRecord
  belongs_to :degree_concentration
  belongs_to :degree_designation
  belongs_to :degree_type
  belongs_to :education

  before_save :set_external_key

  def set_external_key
    self.external_key = "DGRID#{SecureRandom.alphanumeric(11).upcase}"
  end
end
