class KouteimastersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_kouteimaster, only: [:show, :edit, :update, :destroy]

  # GET /kouteimasters
  # GET /kouteimasters.json
  def index
    @kouteimasters = Kouteimaster.all
  end

  # GET /kouteimasters/1
  # GET /kouteimasters/1.json
  def show
  end

  # GET /kouteimasters/new
  def new
    @kouteimaster = Kouteimaster.new
  end

  # GET /kouteimasters/1/edit
  def edit
  end

  # POST /kouteimasters
  # POST /kouteimasters.json
  def create
    @kouteimaster = Kouteimaster.new(kouteimaster_params)

    respond_to do |format|
      if @kouteimaster.save
        format.html { redirect_to @kouteimaster, notice: '新規成功出来ました。' }
        format.json { render action: 'show', status: :created, location: @kouteimaster }
        format.js { render action: 'show', status: :created, location: @kouteimaster }
      else
        format.html { render action: 'new' }
        format.json { render json: @kouteimaster.errors, status: :unprocessable_entity }
        # format.js { render json: @kouteimaster.errors, status: :unprocessable_entity }
        format.js { render 'show' }
      end
    end
  end

  # PATCH/PUT /kouteimasters/1
  # PATCH/PUT /kouteimasters/1.json
  def update
    respond_to do |format|
      if @kouteimaster.update(kouteimaster_params)
        format.html { redirect_to @kouteimaster, notice: '更新成功できました。' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @kouteimaster.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kouteimasters/1
  # DELETE /kouteimasters/1.json
  def destroy
    @kouteimaster.destroy
    respond_to do |format|
      format.html { redirect_to kouteimasters_url }
      format.json { head :no_content }
      format.js {}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kouteimaster
      @kouteimaster = Kouteimaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kouteimaster_params
      params.require(:kouteimaster).permit(:コード, :工程名, :分類)
    end
end
