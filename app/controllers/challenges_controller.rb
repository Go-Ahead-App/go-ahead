class ChallengesController < ApplicationController
  before_action :set_challenge, only: %i[show edit update destroy]

  # GET /challenges or /challenges.json
  def index
    @challenges = Challenge.all
  end

  # GET /challenges/1 or /challenges/1.json
  def show; end

  # GET /challenges/new
  def new
    @challenge = Challenge.new

    render json: { challenge: @challenge }
  end

  # GET /challenges/1/edit
  def edit; end

  # POST /challenges or /challenges.json
  def create
    @challenge = Challenge.new(challenge_params)

    response =
      if @challenge.save
        @challenge.to_json
      else
        @challenge.errors.to_json
      end

    render json: response
  end

  # PATCH/PUT /challenges/1 or /challenges/1.json
  def update
    respond_to do |format|
      if @challenge.update(challenge_params)
        format.html { redirect_to challenge_url(@challenge), notice: 'Challenge was successfully updated.' }
        format.json { render :show, status: :ok, location: @challenge }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /challenges/1 or /challenges/1.json
  def destroy
    @challenge.destroy!

    respond_to do |format|
      format.html { redirect_to challenges_url, notice: 'Challenge was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_challenge
    @challenge = Challenge.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def challenge_params
    params.require(:challenge).permit(:name, :description, :day, :program_id)
  end
end
