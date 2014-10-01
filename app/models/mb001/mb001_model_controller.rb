class Mb001ModelController

	def self.search_all
		query = ''
		query << "SELECT 担当グループコード, 担当グループ名称 FROM 担当グループマスタ"
		records = []
		pg = PgHelper.new
		records = pg.execute_select_query(query)
		return records
	end

	def self.update(id,group_name)
		query = ''
		query << "UPDATE 担当グループマスタ "
		query << "SET 担当グループ名称 = '#{group_name}' "
		query << "WHERE 担当グループコード = '#{id}'"
		pg = PgHelper.new

		if !id.nil?
			return pg.execute_query(query)
		else
			return "1"
		end
	end

	def self.delete_by_id(id)
		query = ''
		query << "DELETE FROM 担当グループマスタ WHERE 担当グループコード='#{id}'"
		pg = PgHelper.new
		if !id.nil?
			return pg.execute_query(query)
		else
			return "1"
		end
	end

	def self.update_by_id(edit_code,edit_name)
		query = ''
		query << "UPDATE 担当グループマスタ SET 担当グループ名称 = '#{edit_name}' WHERE 担当グループコード='#{edit_code}'"
		pg = PgHelper.new
		if !edit_code.nil?
			return pg.execute_query(query)
		else
			return "1"
		end
	end

	def self.searchbyid(id)
		pg = PgHelper.new
		if(!id.nil?)
			query =''
			query << "SELECT  * "
			query << " FROM 担当グループマスタ"
			query << " WHERE 担当グループコード ='#{id.strip}'"

			record = pg.execute_select_query_one(query)
		end
		return record
	end

	def self.insert(model)
		pg = PgHelper.new

		if !model.nil?
			query = "insert into 担当グループマスタ VALUES('#{model.担当グループコード}','#{model.担当グループ名称}','#{model.更新担当者コード}','#{model.更新プログラム}','#{model.更新日時}','#{model.入力日時}')"
			return pg.execute_query(query)
		end
	end

end