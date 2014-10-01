#!/bin/env ruby
# encoding: utf-8
require 'logger.rb'
class Connection
  #================================================================
  #   名　称    Connection
  #   説　明    oracleに連結を作る。
  #   補　足
  #   引　数 なし
  #   戻　値
  # (history)
  #   date         ver        name          comments
  #  -------     -----      ----------  -----------------
  #  2012.08.29  1.00.00     dvquan       担当者の開始を取得します。
  #  2012.08.08  1.00.00     dvquan       新規作成
  #=================================================================
  def initialize
    config   = Rails.configuration.database_configuration
    # host     = config[Rails.env]["host"]
    database = config[Rails.env]['database']
    username = config[Rails.env]['username']
    password = config[Rails.env]['password']    
    
    database = 'JUPITER1' if database.nil?
    username = 'YAYOI' if username.nil?
    password = 'YAYOI' if password.nil?

    @db_user = username
    @db_server = database #TNS
    @db_password = password
  end

  def create_connect
    conn = OCI8.new(@db_user, @db_password, @db_server)
  end

  def database_username
    @db_user
  end

  def database_password
    @db_password
  end

  def database_server
    @db_server
  end

  def database_information
    return "server: " + @db_server + "user: " + @db_user + " password: " + @db_password
  end

  def GetSystemDate
    conn = create_connect
    query = "SELECT TO_CHAR(sysdate, 'YYYY/MM/DD HH24:MI:ss') AS SYSDATE1 FROM DUAL"
    cursor = conn.parse(query)
    cursor.exec
    if r = cursor.fetch_hash
      systemDate = r["SYSDATE1"]
    end

    cursor.close
    conn.logoff
    return systemDate
  end

  def GetSystemDateFormat(stringFormat)
    conn = create_connect
    query = "SELECT TO_CHAR(sysdate, '" + stringFormat + "') AS SYSDATE1 FROM DUAL"
    cursor = conn.parse(query)
    cursor.exec
    if r = cursor.fetch_hash
      systemDate = r["SYSDATE1"]
    end

    cursor.close
    conn.logoff
    return systemDate
  end

  def GetTantoBeginDate(tantoCode, stringDate)
    # 担当者の開始日を取得する。
    # return string
    conn = create_connect
    sysdateString = "TO_DATE('" + stringDate + "','YYYY/MM/DD')"
    query = "SELECT TO_CHAR(F担当者＿開始日取得('" + tantoCode + "'," + sysdateString + "), 'YYYY/MM/DD') AS TANTODATE FROM DUAL"
    cursor = conn.parse(query)
    cursor.exec
    if r = cursor.fetch_hash
      tantoDate = r["TANTODATE"]
    end

    cursor.close
    conn.logoff
    return tantoDate
  end

  def GetHonjitu
    # 担当者の開始日を取得する。
    # return date
    conn = create_connect
    query = "SELECT F本日日付取得 AS HONJUTUDATE FROM DUAL"
    cursor = conn.parse(query)
    cursor.exec
    if r = cursor.fetch_hash
      tantoDate = r["HONJUTUDATE"]
    end
    cursor.close
    conn.logoff
    return tantoDate
  end

  def GetYuukoKikan
    # Fシステム設定数値取得"000001" , "1"
    conn = create_connect
    query = "SELECT Fシステム設定数値取得('000001', '1')  AS KIKAN FROM DUAL"
    cursor = conn.parse(query)
    cursor.exec
    if r = cursor.fetch_hash
      kikan = r["KIKAN"]
    end

    cursor.close
    conn.logoff
    return kikan
  end

  def GetTantoLogin(tantoCode, stringDate, password)
    # ログインフォームに担当者のデータを取得する。
    @records = Array.new
    @record = Hash.new
    tantoDate = GetTantoBeginDate(tantoCode, stringDate)
    if tantoDate.nil? then
      return @records
    end
    tantoDateString = "TO_DATE('" + tantoDate + "','YYYY/MM/DD')"
    query = "SELECT 担当者コード, 担当者名称, 開始日, 終了日, パスワード更新日, 組織コード, 担当グループコード, フォーカス＿メニューコード, 入力日時, 社員区分, パスワード更新日 + Fシステム設定数値取得('000001', '1') AS  パスワード更新日１ FROM 担当者マスタ WHERE 担当者コード=" + ActiveRecord::Base.sanitize(tantoCode)
    query += " and パスワード = " + ActiveRecord::Base.sanitize(password)
    query += " and 開始日 = " + tantoDateString
    Rails.logger.info 'GetTantoLogin.GetTanto: ' + query
    conn = create_connect
    cursor = conn.parse(query)
    cursor.exec
    index = 0
    while r = cursor.fetch_hash
      # puts r.join(",")
      @record = r
      @records[index] = @record
      index = index + 1
    end
    cursor.close
    conn.logoff
    return @records
  end

  def ExecuteSelectQuery(query)
    # execute query for select and return hash value
    conn = create_connect
    cursor = conn.parse(query)
    Rails.logger.info 'ExecuteSelectQuery: ' + query
    @records = Array.new
    @record = Hash.new
    cursor.exec
    index = 0
    while r = cursor.fetch_hash
      # puts r.join(",")
      @record = r
      @records[index] = @record
      index = index + 1
    end
    cursor.close
    conn.logoff
    return @records
  end

  def ExecuteSelectQueryOne(query)
    # execute query for select and return one row hash value
    conn = create_connect
    cursor = conn.parse(query)
    Rails.logger.info 'ExecuteSelectQueryOne: ' + query
    # @records = Array.new
    @record = Hash.new
    cursor.exec
    index = 0
    while r = cursor.fetch_hash
      # puts r.join(",")
      @record = r
      # @records[index] = @record
      # index = index + 1
    end
    cursor.close
    conn.logoff
    return @record
  end

  def ExecuteQuery(query)
    # execute query for update, delete, insert
    conn = create_connect
    cursor = conn.parse(query)
    Rails.logger.info 'ExecuteQuery: ' + query
    results = "0"
    begin
      retcode = cursor.exec
      conn.commit
      cursor.close
      results = "0"
    rescue => error
      conn.rollback
      results = "1"
      Rails.logger.info 'ExecuteQuery.ERROR: ' + error.to_s
    ensure
      conn.logoff
    end

    return results
  end

  def GetTermId
    conn = create_connect
    query = "SELECT 端末番号.nextval AS TERMID FROM DUAL"
    cursor = conn.parse(query)
    cursor.exec
    if r = cursor.fetch_hash
      termId = r["TERMID"]
    end

    cursor.close
    conn.logoff
    return termId
  end

  def GetAmaiHenkan(str)
    # F曖昧変換
    conn   = create_connect
    query  = "SELECT F曖昧変換('" + str + "') AS HENKAN FROM DUAL"
    cursor = conn.parse(query)
    cursor.exec
    if r = cursor.fetch_hash
      stringRet = r["HENKAN"]
    end

    Rails.logger.info 'ExecuteQuery.query: ' + query
    cursor.close
    conn.logoff
    return stringRet
  end

  def pf_get_date_string(date, format)
    # conn = connection
    conn = create_connect
    query = "SELECT TO_CHAR(" + date + ", '" + format + "') AS DATEFORMAT FROM DUAL"
    cursor = conn.parse(query)
    cursor.exec
    if r = cursor.fetch_hash
      stringRet = r["DATEFORMAT"]
    end

    Rails.logger.info 'ExecuteQuery.query: ' + query
    cursor.close
    conn.logoff
    return stringRet
  end
end