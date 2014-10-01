require 'mb001/mb001_model.rb'
require 'mb001/mb001_model_controller.rb'

# class Base::Mb001Controller < BaseController
class Mb001Controller < BaseController
	def index
		@page_title = '担当グループマスタ'
		@records = Mb001ModelController.search_all
		@model = Mb001Model.new
	end

	def create
		@id = params[:selected_code]

		case params[:selected_button]
		when '1'#追加
			redirect_to action: 'add'
		when '2'#編集
			# redirect_to action: 'edit', selected_code: @id
		when '3'
					#削除
			selected_value = params[:selected_value]
			Rails.logger.info "Ajax Posted selected_value:#{selected_value}"
			if !selected_value.nil?
				result = Mb001ModelController.delete_by_id(selected_value)

				if result == '0'
					# redirect_to action: 'index'
				  respond_to do |format|
						data = {status: "OK"}
			      format.json { render :json => data }
					end
				end
			end
		when 'edit_update'
			edit_code = params[:edit_code]
			edit_name = params[:edit_name]
			Rails.logger.info "Ajax Posted edit_code:#{selected_value}, edit_name:#{edit_name}"

			result = Mb001ModelController.update_by_id(edit_code,edit_name)

			if result == '0'
				# redirect_to action: 'index'
			  respond_to do |format|
					data = {status: "OK"}
		      format.json { render :json => data }
				end
			end
			# respond_to do |format|
			# 	if result == '0'
			# 		format.html {render action: 'index'}
			# 	end
			# end
		end

		# request from edit form
		# group_name = params[:input_group_name]
		# group_id = params[:input_group_id]

		# Rails.logger.info "group_id:#{group_id} , group_name:#{group_name}"
		# if !group_id.nil?
		# 	respond_to do |format|
		# 		data = {save_status: 'OK'}
		# 		format.json {render json: data}
		# 		Rails.logger.info "save_status: #{data.to_s}"
		# 	end
		# end
	end

	def edit
		@pageTitle = '担当グループ編集'
		@id = params[:selected_code]
		if request.post?
				group_name = params[:group_name]
				group_id = params[:group_id]
				Rails.logger.info "Update with group_name:#{group_name}, group_id:#{group_id}"
				result = Mb001ModelController.update(group_id,group_name)
				if result == '0'
					@message = '更新成功できました。'
				end
		end
	end

	def add
		@pageTitle = '担当グループ追加'

		if request.post?
			@oh = OracleHelper.new
			sysdate = @oh.get_system_date

			@model = Mb001Model.new
			@model.担当グループコード = params[:group_id]
			@model.担当グループ名称 = params[:group_name]
			@model.更新担当者コード = '1'
			@model.更新プログラム ='1'
			@model.更新日時 =sysdate
			@model.入力日時 =sysdate

			if Mb001ModelController.insert(@model) == "0"
				@message = '更新成功できました！'
			end
		end
	end

	def getAjax
		# test with ajax, get data from client
		# Rails.logger.info "Value of data: #{params[:id]}"

		# test with ajax, post data to client
	  # render json: data, status: :ok
		case params[:selected_button]
		when 'edit_update'

			edit_code = params[:edit_code]
			edit_name = params[:edit_name]
			Rails.logger.info "Ajax Posted edit_code:#{selected_value}, edit_name:#{edit_name}"

			result = Mb001ModelController.update_by_id(edit_code,edit_name)

			if result == '0'
				# redirect_to action: 'index'
			  respond_to do |format|
					data = {status: "OK"}
		      format.json { render :json => data }
				end
			end
		end
	end
end
