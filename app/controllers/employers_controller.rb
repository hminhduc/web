class EmployersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_employer, only: [:show, :edit, :update, :destroy]

  def index
    # get all record
    @employers = Employer.all
    @employer = Employer.new

  end

  def edit
  end

  def show

  end

  def create
    if params[:add]
      @employer = Employer.new(employer_params)

      respond_to do |format|
        if @employer.save
          format.html { redirect_to @employer, notice: '新規成功出来ました。' }
          format.json { render action: 'show', status: :created, location: @employer }
          # format.js { render 'index', status: :created, location: @employer }
          format.js {}
        else
          format.html { render action: 'new' }
          format.json { render json: @employer.errors, status: :unprocessable_entity }
          format.js { render json: @employer.errors, status: :unprocessable_entity }
          # format.js { render 'show' }
        end
      end
    else
      	if !params[:delete].nil?
      		params[:delete].each do |id,value|
      			Employer.find(id.to_i).destroy
      		end
      		respond_to do |format|
      			format.html{}
      			format.json{}
      			format.js{render 'destroy'}
      		end
      	end
    end

  end

  def update
    respond_to do |format|
      if @employer.update(employer_params)
        format.html { redirect_to @employer, notice: '更新成功できました。' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @employer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_employer
    @employer = Employer.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def employer_params
    params.require(:employer).permit(:first_name, :position, :office, :age, :start_date, :salary)
  end

end