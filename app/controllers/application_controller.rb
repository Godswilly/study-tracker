class ApplicationController < ActionController::API
  before_action :authenticate_request
  attr_reader :current_user

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end

  def progress_calculation(study)
    hash = {}
    hash['total_hours'] = study.inject(0) { |sum, n| sum + n.hours }
    hash['total_hours_goal'] = study.inject(0) { |sum, n| sum + n.hours_goal }
    hash['total_projects'] = study.inject(0) { |sum, n| sum + n.projects }
    hash['total_projects_goal'] = study.inject(0) { |sum, n| sum + n.projects_goal }
    hash
  end
end
