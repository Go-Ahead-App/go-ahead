# frozen_string_literal: true

module Api
  module V1
    # Controller for programs API
    class ProgramsController < Api::V1::BaseController
      def index
        @programs = Program.all

        render json: @programs
      end

      def update
        @program = Program.find(params[:id])

        if @program.update(program_params)
          render json: @program
        else
          render json: { error: @program.errors }, status: :unprocessable_entity
        end
      end

      private

      def program_params
        params.require(:program).permit(:name, :description, :duration, :difficulty)
      end
    end
  end
end
