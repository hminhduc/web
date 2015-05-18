class ShozokumastersController < ApplicationController
  def index
    @shozokus = Shozokumaster.all
  end
end