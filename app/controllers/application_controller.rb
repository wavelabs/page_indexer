class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid do |exception|
    render json: { errors: exception, record: exception.record }, status: 422
  end
end
