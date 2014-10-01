require 'm001tree/m001tree_model_controller.rb'

class M001treeController < BaseController
	def index

		@page_title = '構成マスタ　ツリービュー検索'
		@records = []
		@m001tree = {}
		@m001tree['kozo_code']           = params[:kozo_code]
		@m001tree['kozo_name']           = params[:kozo_name]
		@m001tree['hinme_code']          = params[:hinme_code]
		@m001tree['hinme_name']          = params[:hinme_name]
		@m001tree['kijunbi']             = params[:kijunbi]
		@m001tree['nisugata']            = params[:nisugata]
		@m001tree['selected_hinme_code'] = params[:selected_hinme_code]

		if request.post?
			param = params[:m001tree]
			@m001tree['selected_button'] = param[:selected_button]

			case @m001tree['selected_button']
			when 'search'
				param = params[:m001tree]
				@m001tree['kozo_code']  = param[:kozo_code]
				@m001tree['kozo_name']  = param[:kozo_name]
				@m001tree['hinme_code'] = param[:hinme_code]
				@m001tree['hinme_name'] = param[:hinme_name]
				@m001tree['kijunbi']    = param[:kijunbi]
				@m001tree['nisugata']   = param[:nisugata]

				# record = {}
				# record['端末番号']=452267
				# record['表示ラベル']='30011091  豚の生姜焼95G 20*2            梱    2010/10/27〜2099/12/31【試作品】'
				# record['レベル']=1
				# record['ツリー順序']=1
				# record['品目区分']='6'
				# @records[0] = record
				@records = M001treeModelController.search_by('452267')
						
			when 'cancel'
				@m001tree['kozo_code']  = ''
				@m001tree['kozo_name']  = ''
				@m001tree['hinme_code'] = ''
				@m001tree['hinme_name'] = ''
				@m001tree['nisugata']   = ''
				@m001tree['kijunbi']    = ''

			when 'close'
				redirect_to controller: 'm001main', action: 'index'
			end
		end

	end
end