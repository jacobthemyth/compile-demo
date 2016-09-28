class PlaygroundsController < ApplicationController
  def new
    @playground = current_user.playgrounds.build
  end
end
