class KouteimastersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_kouteimaster, only: [:show, :edit, :update, :destroy]
  before_action :set_shozoku, only: [:new, :edit, :create, :update]
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
    @errors = []
  end

  # GET /kouteimasters/1/edit
  def edit
    
  end

  # POST /kouteimasters
  # POST /kouteimasters.json
  def create
    @kouteimaster = Kouteimaster.new(kouteimaster_params)
    
    if !param_valid
      Rails.logger.info 'Param check error'
      @errors = ["所属コードが間違っています。"]
      respond_to do |format|
        format.html {render action: 'new'}
      end
      return
    end

    respond_to do |format|
       if @kouteimaster.save
        format.html { redirect_to @kouteimaster, notice: '新規成功出来ました。' }
        format.json { render action: 'show', status: :created, location: @kouteimaster }
        format.js { render action: 'show', status: :created, location: @kouteimaster }
       else
         set_shozoku
         init
        format.html { render 'new'}
        format.json { render json: @kouteimaster.errors, status: :unprocessable_entity }
        format.js { render json: @kouteimaster.errors, status: :unprocessable_entity }
        # format.js { render 'show' }
      end
    end
  end

  # PATCH/PUT /kouteimasters/1
  # PATCH/PUT /kouteimasters/1.json
  def update
    if !param_valid 
      Rails.logger.info 'Param check error'
      @errors = ["所属コードが間違っています。"]
      respond_to do |format|
        format.html {render action: 'edit'}
      end
      return
    end
    respond_to do |format|
      if @kouteimaster.update(kouteimaster_params)
        format.html { redirect_to kouteimasters_url, notice: '更新成功できました。' }
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
  
  def ajax
    case params[:id]
      when "kouteimaster_所属コード"
        shozoku = Shozokumaster.find_by 所属コード: params[:kouteimaster_所属コード]
        shozoku_name = shozoku.try(:所属名)
        data = {shozoku_name: shozoku_name}
        respond_to do |format|
          format.json { render json: data}
        end
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
  def set_kouteimaster
    @kouteimaster = Kouteimaster.find(params[:id])
    @errors =[]
  end

  def set_shozoku
    @shozokus = Shozokumaster.all
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def kouteimaster_params
    params.require(:kouteimaster).permit(:所属コード, :工程コード, :工程名)
  end
  
  def param_valid
      params[:kouteimaster][:所属コード].in?(Shozokumaster.pluck(:所属コード))
  end
  
  def init
    @errors = []
  end
end
