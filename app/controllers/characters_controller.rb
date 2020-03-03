class CharactersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_character, only: %i[ show destroy ]

  def index
    @characters = current_user.characters
  end

  def show; end

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

  def destroy
    @character.destroy if @character.creator?(current_user)
    redirect_to characters_path
  end

  private

  def set_character
    @character = Character.find(params[:id])
  end

  def character_params
    params.require(:character).permit(:name)
  end
end
