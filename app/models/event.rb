class Event < ActiveRecord::Base
  self.table_name = 'events'
  
  def self.binding_event_by_change_user(user_id)
    sql = "SELECT a.*, b.場所名, c.状態名, d.工程名"
    sql << " FROM events a LEFT OUTER JOIN 場所マスタ b ON a.場所コード = b.場所コード"
    sql << " LEFT OUTER JOIN 状態マスタ c on a.状態コード = c.状態コード"
    sql << " LEFT OUTER JOIN 工程マスタ d on a.所属コード = d.所属コード and a.工程コード = d.工程コード"
    sql << " WHERE a.社員番号 = '#{user_id}'"
    @events = Event.find_by_sql(sql) 
    return @events
  end
end