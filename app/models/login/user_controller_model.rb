class UserControllerModel  < BaseControllerModel

  def self.search_by_id(tantocode)
    @oh = OracleHelper.new
    if(!tantocode.nil?)
      query = ''
      query << "SELECT パスワード"
      query << " FROM 担当者マスタ"
      query << " WHERE TRIM(担当者コード)='#{tantocode.strip}'"
      records = @oh.execute_select_query(query)
    end
    if !records[0].nil?
      return '0'
    end
    return '1'
  end

  def self.update_user(tantocode,password)
    @oh = OracleHelper.new
    sysdate = @oh.get_system_date
    query = ''
    query << "UPDATE 担当者マスタ"
    query << " SET パスワード = '#{password}'" 
    query << " , 更新日時 = '#{sysdate}'"
    query << " WHERE 担当者コード = '#{tantocode}'"
    
    result = @oh.execute_query(query)
    return result
  end

  def self.insert_user(tantocode,tantoname,password)
    @oh = OracleHelper.new
    sysdate = @oh.get_system_date
    # sysdate = Time.now
    # sysdate = sysdate[0,19]
    query = ''
    query << "INSERT INTO 担当者マスタ VALUES('#{tantocode}','#{tantoname}','#{password}','#{sysdate}','#{sysdate}')"
    result = @oh.execute_query(query)
    return result
  end

  def self.get_tanto_login(tantoCode, password)
    # @oh = OracleHelper.new
    pg = PgHelper.new
    record = {}
    query = ''
    query << "SELECT 担当者コード, 担当者名称 FROM 担当者マスタ WHERE TRIM(担当者コード)=#{ActiveRecord::Base.sanitize(tantoCode.strip)}" 
    query << " AND パスワード = #{ActiveRecord::Base.sanitize(password)}"
    record = pg.execute_select_query_one(query)
    return record

  end

  def self.get_all()
    # @oh = OracleHelper.new
    pg = PgHelper.new
    query = ''
    query << "SELECT 担当者コード, 担当者名称 FROM 担当者マスタ"
    return pg.execute_select_query(query)

  end

end
