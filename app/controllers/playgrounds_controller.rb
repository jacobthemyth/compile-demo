class PlaygroundsController < ApplicationController
  def new
    @playground = build_playground
  end

  def create
    @playground = build_playground
    if @playground.save
      flash[:notice] = t(".success")
      redirect_to edit_playground_path(@playground)
    else
      render :new
    end
  end

  def edit
  end

  private

  def build_playground
    current_user.playgrounds.build
  end
end
