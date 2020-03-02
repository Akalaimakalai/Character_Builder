class CharactersController < ApplicationController

  def new
    @character = current_user.characters.new
  end
end
