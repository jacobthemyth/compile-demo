# frozen_string_literal: true
# :nodoc:
class PlaygroundsController < ApplicationController
  def new
    @playground = Playground.new
  end

  def create
    @playground = build_playground
    if @playground.save
      redirect_to edit_playground_path(@playground), notice: t('.success')
    else
      render :new
    end
  end

  def edit
    @playground = Playground.find(params[:id])
  end

  def update
    @playground = current_user.playgrounds.find(params[:id])
    if @playground.update_attributes(playground_params)
      redirect_to edit_playground_path(@playground), notice: t('.success')
    else
      render :edit
    end
  end

  private

  def build_playground
    current_user.playgrounds.build(playground_params)
  end

  def playground_params
    params.require(:playground).permit(:html, :css, :js)
  end
end
