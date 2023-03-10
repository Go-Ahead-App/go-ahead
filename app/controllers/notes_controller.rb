# frozen_string_literal: true

# This is the notes controller, which is responsible for handling requests for notes.
class NotesController < ApplicationController
  use_inertia_instance_props

  before_action :set_board
  before_action :set_note, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /notes or /notes.json
  def index
    @notes = @board.notes
  end

  # GET /notes/1 or /notes/1.json
  def show
    render inertia: 'Notes/Show', props: { note: @note }
  end

  # GET /notes/new
  def new
    @note = @board.notes.new
  end

  # GET /notes/1/edit
  def edit
    render inertia: 'Notes/Edit', props: { note: @note }
  end

  # POST /notes or /notes.json
  def create
    @note = @board.notes.new(note_params)

    respond_to do |format|
      if @note.save
        format.html { redirect_to [@board, @note], notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1 or /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to [@board, @note], notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1 or /notes/1.json
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to board_notes_url(@board), notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_board
    @board = Board.find(params[:board_id])
  end

  def set_note
    @note = @board.notes.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def note_params
    params.require(:note).permit(:title, :description, :content, :board_id)
  end
end
