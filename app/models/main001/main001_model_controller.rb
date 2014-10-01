class Main001ModelController

	def self.search_all
		query = ''
		query << "SELECT * FROM 担当グループマスタ"
		records = []
		@oh = OracleHelper.new
		records = @oh.execute_select_query(query)
		return records
	end
end