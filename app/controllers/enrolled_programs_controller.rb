class EnrolledProgramsController < ApplicationController
  before_action :set_enrolled_program, only: %i[ show edit update destroy ]

  # GET /enrolled_programs or /enrolled_programs.json
  def index
    @enrolled_programs = EnrolledProgram.all
  end

  # GET /enrolled_programs/1 or /enrolled_programs/1.json
  def show
  end

  # GET /enrolled_programs/new
  def new
    @enrolled_program = EnrolledProgram.new
  end

  # GET /enrolled_programs/1/edit
  def edit
  end

  # POST /enrolled_programs or /enrolled_programs.json
  def create
    @enrolled_program = EnrolledProgram.new(enrolled_program_params)

    respond_to do |format|
      if @enrolled_program.save
        format.html { redirect_to enrolled_program_url(@enrolled_program), notice: "Enrolled program was successfully created." }
        format.json { render :show, status: :created, location: @enrolled_program }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @enrolled_program.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /enrolled_programs/1 or /enrolled_programs/1.json
  def update
    respond_to do |format|
      if @enrolled_program.update(enrolled_program_params)
        format.html { redirect_to enrolled_program_url(@enrolled_program), notice: "Enrolled program was successfully updated." }
        format.json { render :show, status: :ok, location: @enrolled_program }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @enrolled_program.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enrolled_programs/1 or /enrolled_programs/1.json
  def destroy
    @enrolled_program.destroy!

    respond_to do |format|
      format.html { redirect_to enrolled_programs_url, notice: "Enrolled program was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enrolled_program
      @enrolled_program = EnrolledProgram.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def enrolled_program_params
      params.require(:enrolled_program).permit(:status, :user_id, :program_id)
    end
end
