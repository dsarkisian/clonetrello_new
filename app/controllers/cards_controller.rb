class CardsController < ApplicationController

  # before_action :set_board
  before_action :set_list
  before_action :set_card, only: [:show, :edit, :update, :destroy]

  def index
    @cards = @list.cards
  end

  def show
  end
  
  def new
    @card = Card.new
  end

  def create
    @card = @list.cards.new(card_params)

    if @card.save
      # redirect_to list_path(@list)
      redirect_to [@list, @card]
    else
      render :new
    end
  end

  def update
    if @list.cards.update(card_params)
      redirect_to [@list, @card]
    else
      render :edit
    end
  end

  def edit
  end

  def destroy
    @card.destroy
    redirect_to list_path(@list)
  end

  private

  # def set_board
  #   @board = current_user.boards.find(params[:board_id])
  # end

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:name, :description)
  end

end
