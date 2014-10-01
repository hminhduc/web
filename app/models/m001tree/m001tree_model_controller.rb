class M001treeModelController

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

	def self.search_by(id)
		pg = PgHelper.new
		query = ""
		query << "SELECT *"
		query << " FROM \"M001_TREE_テンプ\""
		query << " WHERE 端末番号 ='#{id}'"
		query << " ORDER BY ツリー順序"
		return pg.execute_select_query(query)
	end

	def self.insert(model)
		pg = PgHelper.new

		if !model.nil?
			query = "insert into 担当グループマスタ VALUES('#{model.担当グループコード}','#{model.担当グループ名称}','#{model.更新担当者コード}','#{model.更新プログラム}','#{model.更新日時}','#{model.入力日時}')"
			return pg.execute_query(query)
		end
	end

end