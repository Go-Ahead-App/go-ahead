# frozen_string_literal: true

# This class is a controller for the Board model, and it has actions for index, show, new, edit,
# create, update, and destroy.
class BoardsController < ApplicationController
  before_action :set_board, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /boards
  # GET /boards.json
  def index
    @boards = Board.where(user_id: current_user.id)
  end

  # GET /boards/1
  # GET /boards/1.json
  def show; end

  # GET /boards/new
  def new
    @board = Board.new
  end

  # GET /boards/1/edit
  def edit; end

  # POST /boards
  def create
    @board = Board.new(board_params)

    if @board.save
      redirect_to boards_path, notice: 'Board was successfully created.'
    else
      redirect_to new_board_path, form_errors: @board.errors.full_messages
    end
  end

  # PATCH/PUT /boards/1
  def update
    if @board.update(board_params)
      redirect_to boards_path, notice: 'Board was successfully updated.'
    else
      redirect_to edit_board_path(@board), form_errors: @board.errors.full_messages
    end
  end

  # DELETE /boards/1
  # DELETE /boards/1.json
  def destroy
    @board.destroy
    respond_to do |format|
      format.html { redirect_to boards_url, notice: 'Board was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_board
    @board = Board.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def board_params
    params.require(:board).permit(:title, :description, :user_id)
  end
end
