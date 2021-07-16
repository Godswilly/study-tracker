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
    hash['hours'] = study.inject(0) { |sum, e| sum + e.hours }
    hash['goal'] = study.inject(0) { |sum, e| sum + e.goal }
    hash
  end
end
