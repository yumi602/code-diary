class PuzzlesController < ApplicationController
  def index
    @puzzles = Puzzle.all
  end

  def show
    @puzzle = Puzzle.find(params[:id])
  end

  def fill_piece
    @puzzle = Puzzle.find(params[:id])
    @puzzle.fill_next_piece!

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @puzzle }
    end
  end
end
