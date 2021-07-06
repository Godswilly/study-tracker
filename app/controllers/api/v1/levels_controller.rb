class Api::V1::LevelsController < ApplicationController
  skip_before_action :authenticate_request

  def progress
    study = Study.user_studies(current_user)
    progress_data = Study.progress_calculation(study)
    render json: { progress: progress_data }
  end
end
