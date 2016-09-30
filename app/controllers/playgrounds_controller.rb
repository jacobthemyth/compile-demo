class PlaygroundsController < ApplicationController
  def new
    @playground = current_user.playgrounds.build
  end

  def create
    @playground = current_user.playgrounds.build
    if @playground.save
      redirect_to edit_playground_path(@playground)
    else
      render :new
    end
  end
end
