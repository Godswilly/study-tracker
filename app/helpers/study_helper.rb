module StudyHelper
  def self.progress(study)
    hash = {}
    hash['hours'] = study.inject(0) { |sum, e| sum + e.hours }
    hash['goal'] = study.inject(0) { |sum, e| sum + e.goal }
    hash
  end
end
