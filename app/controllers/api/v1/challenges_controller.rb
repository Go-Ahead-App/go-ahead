# frozen_string_literal: true

module Api
  module V1
    # Controller for challenges API
    class ChallengesController < Api::V1::BaseController
      def create
        @challenge = Challenge.new(challenge_params)

        if @challenge.save
          render json: @challenge
        else
          render json: { error: @challenge.errors }, status: :unprocessable_entity
        end
      end

      def update
        @challenge = Challenge.find(params[:id])

        if @challenge.update(challenge_params)
          render json: @challenge
        else
          render json: { error: @challenge.errors }, status: :unprocessable_entity
        end
      end

      private

      def challenge_params
        params.require(:challenge).permit(:name, :description, :program_id)
      end
    end
  end
end
