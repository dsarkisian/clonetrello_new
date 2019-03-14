class BoardsController < ApplicationController

  def index
    @boards = current_user.boards
  end

  def show
    @board = current_user.boards.find(params[:id])
  end

  def new
    @board = current_user.boards.new
  end

  def create
    @board = current_user.boards.new(board_params)

    if @board.save
      redirect_to boards_path
    else
      render :new
    end
  end

  def edit
    @board = current_user.boards.find(params[:id])
  end

  def update
    @board = current_user.boards.find(params[:id]).update(board_params)
    
    if current_user.boards.update(board_params)
      redirect_to boards_path
    else
      render :edit
    end
  end

  def destroy
    current_user.boards.find(params[:id]).destroy
    redirect_to boards_path
  end

  private

  def board_params
    params.require(:board).permit(:name)
  end
end
