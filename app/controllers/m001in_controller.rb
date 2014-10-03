require 'm001in/m001in_model_controller.rb'

class M001inController < BaseController
	def index
		@page_title = '構成マスタ詳細'
		@hash = {}
		@records = M001inModelController.search_all
		@mode = '　新　規　'
	end
end
