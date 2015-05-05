class Kouteimaster < ActiveRecord::Base
  self.table_name = '工程マスタ'
  validates :工程コード, presence: true
  validates :工程名, presence: true

  def self.binding_shozoku(shozoku)
    sql = "SELECT a.*, b.所属名"
    sql << " FROM 工程マスタ a LEFT OUTER JOIN 所属マスタ b ON a.所属コード = b.所属コード"
    sql << " WHERE a.所属コード = '#{shozoku}'"
     koutei = Kouteimaster.find_by_sql(sql)
    return koutei

  end
end
