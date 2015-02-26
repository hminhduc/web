class TreeController < ApplicationController
  skip_before_action :verify_authenticity_token
	
	def index

		@records = []
		record = {}
		record['端末番号']=452267
		record['表示ラベル']='30011091  豚の生姜焼95G 20*2            梱    2010/10/27〜2099/12/31【試作品】'
		record['レベル']='1'
		record['ツリー順序']='1'
		record['品目区分']='6'
		@records[0] = record

		record = {}
		record['端末番号']=452267
		record['表示ラベル']='30011092  豚の生姜焼95G 20*2            梱    '
		record['レベル']='2'
		record['ツリー順序']='2'
		record['品目区分']='4'
		@records[1] = record
		
		record = {}
		record['端末番号']=452267
		record['表示ラベル']='30011093  豚の生姜焼95G 20*2            梱    '
		record['レベル']='2'
		record['ツリー順序']='3'
		record['品目区分']='5'
		@records[2] = record
		
		@m001tree = {}
		@m001tree['kozo_code']           = '99999999'#params[:kozo_code]
		@m001tree['kozo_name']           = '富士通工場'#params[:kozo_name]
		@m001tree['hinme_code']          = '12345678'#params[:hinme_code]
		@m001tree['hinme_name']          = 'カードリーダ'#params[:hinme_name]
		@m001tree['kijunbi']             = '2012/17/01'#params[:kijunbi]
		@m001tree['nisugata']            = 'バグ'#params[:nisugata]
		@m001tree['selected_hinme_code'] = '12345678'#params[:selected_hinme_code]
	end

	def getAjax
		id = params[:id]
    case id
    when 'header_hinme'
      hinme_code = params[:hinme_code]
      hinme_name = 'Hoang Minh Duc'
      respond_to do |format|
        data = {hinme_name: hinme_name }
        format.json {render json: data}
      end
    end
	end

	def upload
		if request.post?
			uploaded_io = params[:person][:picture]
		  File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
		    file.write(uploaded_io.read)
		  end
		end
	end

	def email
		flash[:notice] = ""
		@user = User.find_by(担当者コード: "9999")
		if request.post?
			email = params[:user][:email]
			if email == "hminhduc@gmail.com"
				flash[:notice] = "Someone already has that username. Try another?"
			else
				@user.email = email
				@user.save
			end
		end
	end

	def emailxhr
		email = params[:email]
		if email == "hminhduc@gmail.com"
			respond_to do |format|
				# format.html {render 'email'}
				# format.js {render 'email'}
				data = {error: "true" }
				format.json {render json: data}
			end
		end
	end

	def scroll
		
	end

	def multiselect
		# get all record
		@employers = Employer.all

		if request.post? and !params[:delete].nil?
			params[:delete].each do |id,value|
				Employer.find(id.to_i).destroy
			end
			respond_to do |format|
				format.html{}
				format.json{}
				format.js{}
			end
		end
	end

	def create_employer
		@employer = Employer.new(employer_params)

		respond_to do |format|
			if @employer.save
				format.html { redirect_to @kouteimaster, notice: '新規成功出来ました。' }
				format.json { render action: 'show', status: :created, location: @kouteimaster }
				format.js { render action: 'show', status: :created, location: @kouteimaster }
			else
				format.html { render action: 'new' }
				format.json { render json: @kouteimaster.errors, status: :unprocessable_entity }
				format.js { render json: @kouteimaster.errors, status: :unprocessable_entity }
				# format.js { render 'show' }
			end
		end
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_employer
		@employer = Employer.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def employer_params
		params.require(:employer).permit(:first_name, :position, :office, :start_date, :age, :salary)
	end

end