class Skill < ApplicationRecord
  belongs_to :skill_category
  belongs_to :curriculum_vitae

  has_many :employments_skills
  has_many :employments, through: :employments_skills
end
