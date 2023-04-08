# frozen_string_literal: true

# This is a Ruby class that defines the controller for a program model, with methods for handling CRUD
# operations and authentication.
class ProgramsController < ApplicationController
  before_action :set_program, only: %i[show edit update destroy]
  before_action :authenticate_admin!, only: %i[new edit create update destroy]

  # GET /programs or /programs.json
  def index
    @programs = Program.all
  end

  # GET /programs/1 or /programs/1.json
  def show; end

  # GET /programs/new
  def new
    @program = Program.new

    render inertia: 'Programs/New', props: { program: @program }
  end

  # GET /programs/1/edit
  def edit
    render inertia: 'Programs/Edit', props: { program: @program, challenges: @program.challenges }
  end

  # POST /programs or /programs.json
  def create
    @program = Program.new(program_params)

    respond_to do |format|
      if @program.save
        format.html { redirect_to program_url(@program), notice: 'Program was successfully created.' }
        format.json { render :show, status: :created, location: @program }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @program.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /programs/1 or /programs/1.json
  def update
    respond_to do |format|
      if @program.update(program_params)
        format.html { redirect_to edit_program_url(@program), notice: 'Program was successfully updated.' }
        format.json { render :show, status: :ok, location: @program }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @program.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /programs/1 or /programs/1.json
  def destroy
    @program.destroy!

    respond_to do |format|
      format.html { redirect_to programs_url, notice: 'Program was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_program
    @program = Program.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def program_params
    params.require(:program).permit(:name, :description, :difficulty, :length)
  end
end
