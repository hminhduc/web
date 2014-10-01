class M001inModelController 
	def self.search_all
		query = ''
		tanmatu = '490828'
		query << "SELECT * FROM \"M001_INP_テンプ\" A "
		query << "WHERE		A.端末番号		= '#{tanmatu}'"
		records = []
		pg = PgHelper.new
		records = pg.execute_select_query(query)
		return records
	end
end