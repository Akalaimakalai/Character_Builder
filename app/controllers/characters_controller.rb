class CharactersController < ApplicationController

  def show
    @character = Character.find(params[:id])
  end

  def new
    @character = current_user.characters.new
  end

  def create
    @character = current_user.characters.new(character_params)

    if @character.save
      redirect_to character_path(@character)
    else
      render :new
    end
  end

  private

  def character_params
    params.require(:character).permit(:name)
  end
end
