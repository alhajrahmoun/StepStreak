module Api
  class ActivitiesController < ApplicationController
    before_action :check_params, only: :create
    def create
      ActivitiesJob.perform_later(activity_params)
      render json: { message: 'Activities are being processed' }, status: :accepted
    end

    private
    def activity_params
      params.require(:activity).map do |activity_params|
        activity_params.permit(
          :steps,
          :distance,
          :max_heart_rate,
          :date,
          :heart_rate,
          :calories,
          :resting_heart_rate
        )
      end
    end

    def check_params
      if params[:activity].blank?
        Turbo::StreamsChannel.broadcast_update_to(
          "activities_turbo_native",
          target: 'dashboard-details',
          content: '<turbo-frame id="dashboard" src="http://192.168.0.89:3000/dashboard" data-controller="reload">' )

        render json: { message: 'Activity params are missing' }, status: :unprocessable_entity
      end
    end
  end
end
