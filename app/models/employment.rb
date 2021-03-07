class Employment < ApplicationRecord
  belongs_to :organization
  belongs_to :curriculum_vitae

  has_many :achievements
  has_many :positions
  has_many :employments_skills
  has_many :skills, through: :employments_skills

  before_save :set_external_key

  def set_external_key
    self.external_key = "EMPID#{SecureRandom.alphanumeric(11).upcase}"
  end

  def employment_range
    "#{start_date&.strftime('%Y')} - #{end_date&.strftime('%Y') || 'Present'}"
  end
end
