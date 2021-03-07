class EmploymentsSkill < ApplicationRecord
  belongs_to :employment
  belongs_to :skill
end
