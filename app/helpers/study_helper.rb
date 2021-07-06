class StudyHelpers
  def self.progress_calculation(study)
    hash = {}
    hash['total_hours'] = study.inject(0) { |sum, n| sum + n.hours }
    hash['total_hours_goal'] = study.inject(0) { |sum, n| sum + n.hours_goal }
    hash['total_projects'] = study.inject(0) { |sum, n| sum + n.projects }
    hash['total_projects_goal'] = study.inject(0) { |sum, n| sum + n.projects_goal }
    hash
  end
end
