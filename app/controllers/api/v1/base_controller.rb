# frozen_string_literal: true

module Api
  module V1
    # This is a Ruby class that sets the response format to JSON for the BaseController.
    class BaseController < ApplicationController
      respond_to :json

      rescue_from ActionController::ParameterMissing, with: :bad_request
      rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity
      rescue_from ActiveRecord::RecordNotFound, with: :not_found
      rescue_from ActionController::RoutingError, with: :not_found
      rescue_from ActionController::UnknownFormat, with: :not_found
    end
  end
end
