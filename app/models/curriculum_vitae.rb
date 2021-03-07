class CurriculumVitae < ApplicationRecord
  has_one :profile
  has_one :user, through: :profile

  has_many :educations
  has_many :employments
  has_many :skills
end
