exit unless Rails.env.test? || Rails.env.development?

puts 'Seeding the database...'

puts 'Creating curriculum vitae...'

curriculum_vitae = CurriculumVitae.create(
  description: 'To obtain a position in the field of web development in which I can expand upon and use my existing ' \
             'proficiency and skill in technical organization and implementation, leadership, and teamwork'
)

puts 'Creating user...'

user = User.create(email: 'japenner@gmail.com', password: 'brandnewpassword')

puts 'Creating profile...'

profile = Profile.create(
  first_name: 'Jacob',
  last_name: 'Penner',
  curriculum_vitae: curriculum_vitae,
  contact_info: ContactInfo.create(
    address: Address.create(street: '1234 Test Road', city: 'Fort Wayne', state: 'IN', zip: '46825'),
    email: 'jjjjjjjj@gmail.com',
    phone: '1232343456'
  ),
  user_id: user.id
)

puts 'Creating social media accounts...'

[
  { name: 'Github', site: 'https://github.com', link: 'https://github.com/japenner' },
  { name: 'LinkedIn', site: 'https://linkedin.com', link: 'https://linkedin.com/japenner' }
].each do |media|
  SocialMediaAccount.create(
    profile_id: profile.id,
    link: media[:link],
    social_media_id: SocialMedia.create(name: media[:name], site: media[:site]).id
  )
end

puts 'Creating education data...'

education = Education.create(
  curriculum_vitae: curriculum_vitae,
  organization: Organization.create(
    contact_info: ContactInfo.create(
      email: nil,
      phone: nil,
      address: Address.create(street: nil, city: 'Fort Wayne', state: 'IN', zip: nil)
    ),
    name: 'Purdue University',
    organization_type: OrganizationType.create(name: 'University')
  )
)

cs_concentration = DegreeConcentration.create(name: 'Computer Science')
b_concentration = DegreeConcentration.create(name: 'Business')
psy_concentration = DegreeConcentration.create(name: 'Psychology')

bs_type = DegreeType.create(name: 'Bachelors of Science')

major_designation = DegreeDesignation.create(name: 'Major')
minor_designation = DegreeDesignation.create(name: 'Minor')

[
  { concentration: cs_concentration, type: bs_type, designation: major_designation },
  { concentration: b_concentration, type: bs_type, designation: minor_designation },
  { concentration: psy_concentration, type: bs_type, designation: minor_designation }
].each do |degree|
  Degree.create(
    degree_designation: degree[:designation],
    degree_concentration: degree[:concentration],
    degree_type: degree[:type],
    education: education,
    end_date: nil,
    start_date: nil,
    was_completed: true
  )
end

puts 'Creating skill data...'

frameworks_skill_category = SkillCategory.create(name: 'Frameworks')
languages_skill_category = SkillCategory.create(name: 'Languages')
other_skill_category = SkillCategory.create(name: 'Other')
paradigms_skill_category = SkillCategory.create(name: 'Paradigms')
platform_skill_category = SkillCategory.create(name: 'Platform')
storage_skill_category = SkillCategory.create(name: 'Storage')
tools_skill_category = SkillCategory.create(name: 'Tools')

mysql_skill = Skill.create(curriculum_vitae: curriculum_vitae, name: 'MySQL', skill_category: storage_skill_category, years_experience: 4,  score: 5)
sql_server_skill = Skill.create(curriculum_vitae: curriculum_vitae, name: 'SQL Server', skill_category: storage_skill_category, years_experience: 5,  score: 5)
sql_skill = Skill.create(curriculum_vitae: curriculum_vitae, name: 'SQL', skill_category: storage_skill_category, years_experience: 7,  score: 5)

c_sharp_skill = Skill.create(curriculum_vitae: curriculum_vitae, name: 'C#', skill_category: languages_skill_category, years_experience: 2,  score: 5)
css_skill = Skill.create(curriculum_vitae: curriculum_vitae, name: 'CSS3', skill_category: languages_skill_category, years_experience: 7,  score: 5)
html_skill = Skill.create(curriculum_vitae: curriculum_vitae, name: 'HTML5', skill_category: languages_skill_category, years_experience: 7,  score: 5)
java_skill = Skill.create(curriculum_vitae: curriculum_vitae, name: 'Java', skill_category: languages_skill_category, years_experience: 1,  score: 5)
js_skill = Skill.create(curriculum_vitae: curriculum_vitae, name: 'JavaScript', skill_category: languages_skill_category, years_experience: 7,  score: 5)
kotlin_skill = Skill.create(curriculum_vitae: curriculum_vitae, name: 'Kotlin', skill_category: languages_skill_category, years_experience: 1,  score: 5)
ruby_skill = Skill.create(curriculum_vitae: curriculum_vitae, name: 'Ruby', skill_category: languages_skill_category, years_experience: 7,  score: 5)
typescript_skill = Skill.create(curriculum_vitae: curriculum_vitae, name: 'Typescript', skill_category: languages_skill_category, years_experience: 2,  score: 5)

angular_skill = Skill.create(curriculum_vitae: curriculum_vitae, name: 'Angular', skill_category: frameworks_skill_category,  years_experience: 2,  score: 5)
bootstrap_skill = Skill.create(curriculum_vitae: curriculum_vitae, name: 'Twitter Bootstrap', skill_category: frameworks_skill_category,  years_experience: 1,  score: 5)
dot_net_skill = Skill.create(curriculum_vitae: curriculum_vitae, name: '.NET Core', skill_category: frameworks_skill_category,  years_experience: 2,  score: 5)
prime_ng_skill = Skill.create(curriculum_vitae: curriculum_vitae, name: 'PrimeNG', skill_category: frameworks_skill_category,  years_experience: 2,  score: 5)
rails_skill = Skill.create(curriculum_vitae: curriculum_vitae, name: 'Ruby on Rails', skill_category: frameworks_skill_category,  years_experience: 7,  score: 5)

aws_skill = Skill.create(curriculum_vitae: curriculum_vitae, name: 'AWS', skill_category: platform_skill_category, years_experience: 3,  score: 5)
azure_skill = Skill.create(curriculum_vitae: curriculum_vitae, name: 'Azure DevOps', skill_category: platform_skill_category, years_experience: 2, score: 5)
chef_skill = Skill.create(curriculum_vitae: curriculum_vitae, name: 'Chef', skill_category: platform_skill_category, years_experience: 1, score: 5)
docker_skill = Skill.create(curriculum_vitae: curriculum_vitae, name: 'Docker', skill_category: platform_skill_category, years_experience: 4, score: 5)
jenkins_skill = Skill.create(curriculum_vitae: curriculum_vitae, name: 'Jenkins', skill_category: platform_skill_category, years_experience: 1, score: 5)

kanban_skill = Skill.create(curriculum_vitae: curriculum_vitae, name: 'Kanban', skill_category: paradigms_skill_category,  years_experience: 2, score: 5)
scrum_skill = Skill.create(curriculum_vitae: curriculum_vitae, name: 'Scrum', skill_category: paradigms_skill_category,  years_experience: 3, score: 5)
tdd_skill = Skill.create(curriculum_vitae: curriculum_vitae, name: 'Test-driven Development (TDD)', skill_category: paradigms_skill_category, years_experience: 5, score: 5)

git_skill = Skill.create(curriculum_vitae: curriculum_vitae, name: 'Git', skill_category: tools_skill_category, years_experience: 7, score: 5)

puts 'Creating employment data...'

business_org_type = OrganizationType.create(name: 'Employer')

rs_employment = Employment.create(
  curriculum_vitae: curriculum_vitae,
  start_date: DateTime.parse('5/1/2019'),
  end_date: nil,
  impact: 'I learned a lot',
  organization: Organization.create(
    name: 'Ramsey Solutions',
    organization_type: business_org_type,
    contact_info: ContactInfo.create(
      address: Address.create(
        street: '1011 Reams Fleming Blvd',
        city: 'Franklin',
        state: 'TN',
        zip: '37064'
      ),
      email: nil,
      phone: nil
    )
  )
)

Position.create(employment: rs_employment, title: 'Full Stack Web Developer')

Achievement.create(employment: rs_employment, value: 'Stuff')
Achievement.create(employment: rs_employment, value: 'Thangs')

osv_employment = Employment.create(
  curriculum_vitae: curriculum_vitae,
  start_date: DateTime.parse('9/1/2016'),
  end_date: DateTime.parse('5/1/2019'),
  impact: 'I learned a lot',
  organization: Organization.create(
    name: 'Our Sunday Visitor',
    organization_type: business_org_type,
    contact_info: ContactInfo.create(
      address: Address.create(
        street: '200 Noll Plaza',
        city: 'Huntington',
        state: 'IN',
        zip: '46750'
      ),
      email: nil,
      phone: nil
    )
  )
)

osv_position = Position.create(employment: osv_employment, title: 'Full Stack Web Developer')
osv_position_two = Position.create(employment: osv_employment, title: 'Security Champion')

Responsibility.create(position: osv_position, value: 'Did stuff')
Responsibility.create(position: osv_position_two, value: 'Did other stuff')

Achievement.create(employment: osv_employment, value: 'Worked with a team of 12 to develop a new platform from the ground up for organization communications, money transfers, and user management to be used by both local and international churches')
Achievement.create(employment: osv_employment, value: 'Implemented the usage of the OWASP Zap automated security suite within the main application’s deployment stack in order to monitor application security threats')
Achievement.create(employment: osv_employment, value: 'Held several training sessions on various security related topics in order to raise developer awareness of best cyber and physical security practices')
Achievement.create(employment: osv_employment, value: 'Developed instructive documentation on the topics of physical, application, and infrastructure security')

sqm_employment = Employment.create(
  curriculum_vitae: curriculum_vitae,
  start_date: DateTime.parse('12/1/2015'),
  end_date: DateTime.parse('9/1/2016'),
  impact: 'I learned a lot',
  organization: Organization.create(
    name: 'Squaremouth',
    organization_type: business_org_type,
    contact_info: ContactInfo.create(
      address: Address.create(
        street: '',
        city: 'Fort Wayne',
        state: 'IN',
        zip: ''
      ),
      email: nil,
      phone: nil
    )
  )
)

sm_position = Position.create(employment: sqm_employment, title: 'Full Stack Web Developer')

Responsibility.create(position: sm_position, value: 'Did stuff')
Responsibility.create(position: sm_position, value: 'Did other stuff')

Achievement.create(employment: sqm_employment, value: 'Worked with a team of 4 to develop a new customer login and configuration system using the best practices for modern Ruby on Rails and JavaScript based web applications')
Achievement.create(employment: sqm_employment, value: 'Developed continuous integration tests to be used in conjunction with the Chef testing platform')
Achievement.create(employment: sqm_employment, value: 'Experience in best practices with using the Docker platform')
Achievement.create(employment: sqm_employment, value: 'Acted as a liaison between Squaremouth and its travel insurance carriers, interfacing directly with each carrier’s IT department if any errors, updates, or questions needed to be addressed')
Achievement.create(employment: sqm_employment, value: 'Acted as “Exterminator” within a revolving schedule where I was in charge of handling all bugs and errors which would be produced during the assigned week')

ens_employment = Employment.create(
  curriculum_vitae: curriculum_vitae,
  start_date: Date.parse('5/1/2014'),
  end_date: Date.parse('12/1/2015'),
  impact: 'I learned a lot',
  organization: Organization.create(
    name: 'Enspire Software',
    organization_type: business_org_type,
    contact_info: ContactInfo.create(
      address: Address.create(
        street: '',
        city: 'Fort Wayne',
        state: 'IN',
        zip: ''
      ),
      email: nil,
      phone: nil
    )
  )
)

es_position = Position.create(employment: ens_employment, title: 'Full Stack Software Engineer')
es_position_two = Position.create(employment: ens_employment, title: 'Scrum Master')

Responsibility.create(position: es_position, value: 'Did stuff')
Responsibility.create(position: es_position_two, value: 'Did other stuff')

Achievement.create(employment: ens_employment, value: 'Worked closely with Business Analysts to develop requirements and a production schedule for implementing an engineering database management system project as well as a real estate listing engine project')
Achievement.create(employment: ens_employment, value: 'Acted as the first Scrum master for the Ruby on Rails team and helped to instantiate best practices and security controls in following the Scrum development process as well as planned and held several kick-off, Scrum status, and retrospective meetings for the team')
Achievement.create(employment: ens_employment, value: 'Developed documentation for and built out several reusable components and modules for all of Enspire Software’s Ruby on Rails applications')
Achievement.create(employment: ens_employment, value: 'Lead and cultivated a full QA team to better assess and rectify existing application defects as well as prevent new software defects including security concerns within all Ruby on Rails web applications')
Achievement.create(employment: ens_employment, value: 'Was utilized as a designer/developer during the initial stages of a new system and upon completion of each project, acted as an ongoing support presence to maintain each project')

puts 'Assigning skills to employment data...'

EmploymentsSkill.create(employment: ens_employment, skill: mysql_skill)
EmploymentsSkill.create(employment: sqm_employment, skill: mysql_skill)

EmploymentsSkill.create(employment: rs_employment, skill: sql_skill)
EmploymentsSkill.create(employment: osv_employment, skill: sql_skill)
EmploymentsSkill.create(employment: sqm_employment, skill: sql_skill)
EmploymentsSkill.create(employment: ens_employment, skill: sql_skill)

EmploymentsSkill.create(employment: rs_employment, skill: sql_server_skill)
EmploymentsSkill.create(employment: osv_employment, skill: sql_server_skill)

EmploymentsSkill.create(employment: rs_employment, skill: ruby_skill)
EmploymentsSkill.create(employment: osv_employment, skill: ruby_skill)
EmploymentsSkill.create(employment: sqm_employment, skill: ruby_skill)
EmploymentsSkill.create(employment: ens_employment, skill: ruby_skill)

EmploymentsSkill.create(employment: osv_employment, skill: c_sharp_skill)

EmploymentsSkill.create(employment: rs_employment, skill: java_skill)

EmploymentsSkill.create(employment: rs_employment, skill: kotlin_skill)

EmploymentsSkill.create(employment: rs_employment, skill: html_skill)
EmploymentsSkill.create(employment: osv_employment, skill: html_skill)
EmploymentsSkill.create(employment: sqm_employment, skill: html_skill)
EmploymentsSkill.create(employment: ens_employment, skill: html_skill)

EmploymentsSkill.create(employment: rs_employment, skill: css_skill)
EmploymentsSkill.create(employment: osv_employment, skill: css_skill)
EmploymentsSkill.create(employment: sqm_employment, skill: css_skill)
EmploymentsSkill.create(employment: ens_employment, skill: css_skill)

EmploymentsSkill.create(employment: rs_employment, skill: js_skill)
EmploymentsSkill.create(employment: osv_employment, skill: js_skill)
EmploymentsSkill.create(employment: sqm_employment, skill: js_skill)
EmploymentsSkill.create(employment: ens_employment, skill: js_skill)

EmploymentsSkill.create(employment: osv_employment, skill: typescript_skill)

EmploymentsSkill.create(employment: osv_employment, skill: dot_net_skill)

EmploymentsSkill.create(employment: osv_employment, skill: angular_skill)

EmploymentsSkill.create(employment: osv_employment, skill: prime_ng_skill)

EmploymentsSkill.create(employment: rs_employment, skill: rails_skill)
EmploymentsSkill.create(employment: osv_employment, skill: rails_skill)
EmploymentsSkill.create(employment: sqm_employment, skill: rails_skill)
EmploymentsSkill.create(employment: ens_employment, skill: rails_skill)

EmploymentsSkill.create(employment: ens_employment, skill: bootstrap_skill)

EmploymentsSkill.create(employment: rs_employment, skill: aws_skill)
EmploymentsSkill.create(employment: osv_employment, skill: aws_skill)
EmploymentsSkill.create(employment: sqm_employment, skill: aws_skill)

EmploymentsSkill.create(employment: osv_employment, skill: azure_skill)

EmploymentsSkill.create(employment: sqm_employment, skill: jenkins_skill)

EmploymentsSkill.create(employment: rs_employment, skill: docker_skill)
EmploymentsSkill.create(employment: sqm_employment, skill: docker_skill)

EmploymentsSkill.create(employment: sqm_employment, skill: chef_skill)

EmploymentsSkill.create(employment: rs_employment, skill: tdd_skill)
EmploymentsSkill.create(employment: osv_employment, skill: tdd_skill)
EmploymentsSkill.create(employment: sqm_employment, skill: tdd_skill)
EmploymentsSkill.create(employment: ens_employment, skill: tdd_skill)

EmploymentsSkill.create(employment: rs_employment, skill: kanban_skill)
EmploymentsSkill.create(employment: osv_employment, skill: kanban_skill)

EmploymentsSkill.create(employment: osv_employment, skill: scrum_skill)
EmploymentsSkill.create(employment: ens_employment, skill: scrum_skill)

EmploymentsSkill.create(employment: rs_employment, skill: git_skill)
EmploymentsSkill.create(employment: osv_employment, skill: git_skill)
EmploymentsSkill.create(employment: sqm_employment, skill: git_skill)
EmploymentsSkill.create(employment: ens_employment, skill: git_skill)
