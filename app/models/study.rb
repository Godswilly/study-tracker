class Study < ApplicationRecord
  belongs_to :user

  validates :hours, presence: true
  validates :goal, presence: true
  validates :user_id, presence: true

  scope :user_studies, lambda { |id|
    where(user_id: id)
  }

  scope :order_study_data, -> { user_studies(@current_user.id).order(:created_at, :desc) }

  def self.progress(study)
    hash = {}
    hash['hours'] = study.inject(0) { |sum, e| sum + e.hours }
    hash['goal'] = study.inject(0) { |sum, e| sum + e.goal }
    hash
  end
end
