class JoutaimastersController < ApplicationController
  def index
    @joutais = Joutaimaster.all
  end
end