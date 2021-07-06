class Api::V1::StudiesController < ApplicationController
  before_action :authenticate_request
  before_action :set_study, only: %i[show update destroy]

  def index
    study = Study.user_studies(current_user)
    render json: study
  end

  def create
    study = @current_user.studies.build(name: params[:name], hours: params[:hours], hours_goal: params[:hours_goal], projects: params[:projects], projects_goal: params[:projects_goal],user_id: current_user)
    if study.save
      render json: study, status: :created
    else
      render json: { error: study.errors.full_messages }
    end
  end

  def show
    if @set_study
      render json: @set_study
    else
      render json: @set_study.errors.full_messages
    end
  end

  def update
    if @set_study.update(study_params)
      render json: { status: :created, study: @set_study }
    else
      render json: @set_study.errors.full_messages, status: 401
    end
  end

  def destroy
    if @set_study&.destroy
      render json: { message: 'Study record deleted successfully!', status: 201 }
    else
      render json: { messages: 'Study record could not be deleted', status: 401 }
    end
  end

  private

  def study_params
    params.require(:study).permit(:name, :hours, :hours_goal, :projects, :projects_goal, :user_id)
  end

  def set_study
    @set_study ||= Study.find(params[:id])
  end
end
