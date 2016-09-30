class PlaygroundsController < ApplicationController
  def new
    @playground = current_user.playgrounds.build
  end

  def create
  end
end
