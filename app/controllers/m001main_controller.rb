require 'm001main/m001main_model_controller.rb'

class M001mainController < BaseController
	def index
		@page_title = '構成マスタ'
		@records    = []
		@hash       = {}
		@pw_hin     = [] #M001mainModelController.search_all_hinme()
		@check_flag = ''
		if request.post?
			selected_button = params[:m001main]['selected_button']
			case selected_button
			when 'tree_update'
				redirect_to "/m001tree/index?#{params[:m001main].to_param}"
			when 'search'
				param = params[:m001main]
				@hash['kozo_code']  = param['kozo_code']
				@hash['kozo_name']  = param['kozo_name']
				@hash['hinme_code'] = param['hinme_code']
				@hash['hinme_name'] = param['hinme_name']
				@hash['nisugata']   = param['nisugata']
				@hash['kijunbi']    = param['kijunbi']


				@records = M001mainModelController.search_by(@hash)
			when 'cancel'
				@hash['kozo_code']  = ''
				@hash['kozo_name']  = ''
				@hash['hinme_code'] = ''
				@hash['hinme_name'] = ''
				@hash['nisugata']   = ''
				@hash['kijunbi']    = ''
			when 'close'
					# redirect_to controller: 'main001', action: 'index'
			when 'new'
				redirect_to "/m001in/index?#{params[:m001main].to_param}"
			when 'pw_hinme_search'
				@pw_hin = M001mainModelController.search_all_hinme()
				@check_flag = '1'
			end
		end

	end

	def getAjax
			id = params[:id]

			case id
			when 'header_kozo'
				kozo_code   = params[:kozo_code]
				kozo_record = M001mainModelController.search_kozo(kozo_code)
				kozo_name   = kozo_record['組織名称']

				respond_to do |format|
					data = {kozo_name: kozo_name}
					format.json {render json: data}
				end

			when 'header_hinme'
				hinme_code   = params[:hinme_code]
				hinme_record = M001mainModelController.search_hinme(hinme_code)
				hinme_name   = hinme_record['品目略名称']

				tani_records = M001mainModelController.search_tani(hinme_code)
				Rails.logger.info tani_records.to_s

				i = 0
				dropdown = []
				tani_records.each do |hash|
					dropdown[i] = hash['荷姿コード']
					i = i + 1
				end

				respond_to do |format|
					data = {hinme_name: hinme_name, dropdown: dropdown}
					format.json {render json: data}
				end

			end #case

	end #getAjax

 end #file