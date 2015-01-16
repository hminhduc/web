class TantoshasController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_tantosha, only: [:show, :edit, :update, :destroy]

  # GET /tantoshas
  # GET /tantoshas.json
  def index
    @tantoshas = Tantosha.all
    @pageTitle = '担当者マスタ'
  end

  # GET /tantoshas/1
  # GET /tantoshas/1.json
  def show
  end

  # GET /tantoshas/new
  def new
    @tantosha = Tantosha.new
    @pageTitle = '担当者マスタ・新規'
  end

  # GET /tantoshas/1/edit
  def edit
    @pageTitle = '担当者マスタ・編集'
  end

  # POST /tantoshas
  # POST /tantoshas.json
  def create
    @tantosha = Tantosha.new(tantosha_params)

    respond_to do |format|
      if @tantosha.save
        format.html { redirect_to @tantosha, notice: '担当者は追加できました。' }
        format.json { render action: 'show', status: :created, location: @tantosha }
      else
        format.html { render action: 'new' }
        format.json { render json: @tantosha.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tantoshas/1
  # PATCH/PUT /tantoshas/1.json
  def update
    respond_to do |format|
      if @tantosha.update(tantosha_params)
        format.html { redirect_to @tantosha, notice: '担当者は更新成功できました。' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tantosha.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tantoshas/1
  # DELETE /tantoshas/1.json
  def destroy
    @tantosha.destroy
    # @tantosha.delete
    respond_to do |format|
      format.html { redirect_to tantoshas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tantosha
      @tantosha = Tantosha.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tantosha_params
      params.require(:tantosha).permit(:tannto_code, :tanto_name, :password)
    end
end
