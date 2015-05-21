class BashomastersController < ApplicationController
  def index
    @bashos = Bashomaster.all
  end
end