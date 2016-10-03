# frozen_string_literal: true
# :nodoc:
class PlaygroundsController < ApplicationController
  def new
    @playground = Playground.new
  end

  def create
    @playground = build_playground
    if @playground.save
      flash[:notice] = t('.success')
      redirect_to edit_playground_path(@playground)
    else
      render :new
    end
  end

  def edit
    @playground = Playground.find(params[:id])
  end

  private

  def build_playground
    current_user.playgrounds.build(playground_params)
  end

  def playground_params
    params.require(:playground).permit(:html, :css, :js)
  end
end
