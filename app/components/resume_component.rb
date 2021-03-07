class ResumeComponent < BaseComponent
  attr_reader :name,
              :description,
              :address,
              :educations,
              :skills,
              :employments

  def initialize(cv:)
    @name = cv.profile.full_name
    @description = cv.description
    @address = cv.profile.contact_info.address
    @educations = cv.educations
    @skills = cv.skills
    @employments = cv.employments

    super
  end

  def formatted_address
    "#{address.city}, #{address.state}."
  end

  def top_skills
    skills.select { |s| s.skill_category.name == 'Languages' || s.skill_category.name == 'Frameworks' }
          .sort_by(&:years_experience)
          .reverse
          .take(7)
  end

  def skill_list(employment)
    employment.skills.map(&:name).join(', ')
  end
end
