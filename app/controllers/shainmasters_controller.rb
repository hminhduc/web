class ShainmastersController < ApplicationController
  def index
    @shains = Shainmaster.all
  end
end
