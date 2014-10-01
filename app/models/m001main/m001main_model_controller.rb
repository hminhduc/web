class M001mainModelController

	def self.search_all
		query = ''
		query << "SELECT * FROM 構成基本マスタ"
		pg = PgHelper.new
		return pg.execute_select_query(query)
	end
	
def self.search_by(hashvalue)
		query = ''
		query << "SELECT * FROM 構成基本マスタ WHERE 1=1"
		if !hashvalue['kozo_code'].empty?
			query << " AND 工場組織コード = '#{hashvalue['kozo_code']}'"
		end

		if !hashvalue['hinme_code'].empty?
			query << " AND 出来高品目コード = '#{hashvalue['hinme_code']}'"
		end
		
		if !hashvalue['nisugata'].empty?
			query << " AND 出来高荷姿コード = '#{hashvalue['nisugata']}'"			
		end

		if !hashvalue['kijunbi'].empty?
			query << " AND 開始日 = '#{hashvalue['kijunbi']}'"			
		end

		pg = PgHelper.new
		return pg.execute_select_query(query)
	end

	def self.search_kozo(id)
		query = ''
		query << "SELECT 組織名称 FROM 組織マスタ WHERE TRIM(組織コード) = '#{id.strip}' AND 事業年月 = '2010/04/01'"
		record = {}
		pg = PgHelper.new
		record = pg.execute_select_query_one(query)
		return record
	end

	def self.search_hinme(id)
		query = ''
		query << "SELECT 品目略名称 FROM 品目マスタ WHERE TRIM(品目コード) = '#{id.strip}'"
		record = {}
		pg = PgHelper.new
		record = pg.execute_select_query_one(query)
		return record
	end

	def self.search_all_hinme()
		query = ''
		query << "SELECT 品目コード,品目略名称,品目区分＿販売,品目区分＿購買,品目区分＿生産,最終使用日 FROM 品目マスタ"
		records = []
		# @oh = OracleHelper.new
		# records = @oh.execute_select_query(query)
		pg      = PgHelper.new
		records = pg.execute_select_query(query)
		return records
	end

	def self.search_tani(id)
		query = ''
		query << "SELECT 荷姿コード FROM 品目荷姿マスタ WHERE TRIM(品目コード) = '#{id.strip}'"
		records = []
		pg = PgHelper.new
		records = pg.execute_select_query(query)
		return records
	end

end