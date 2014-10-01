class ShozaisController < ApplicationController
  def index
    @shozais = Shozai.all

  end

  def select
    @data = params[:shozai]
  end

  def edit

  end

  def new
   @shozai = Shozai.new
   @kouteis = Kouteimaster.all
   @sagyous = Sagyou.all
  end

  def main

  end

  def getAjax
    id = params[:id]
    case id
    when 'shozai_所在名'
      koutei_code = params[:koutei_code]
      koutei_name = 'Hoang Minh Duc'
      respond_to do |format|
        data = {koutei_name: koutei_name }
        format.json {render json: data}
      end
    end
  end
end
