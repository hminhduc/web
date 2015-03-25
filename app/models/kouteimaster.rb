class Kouteimaster < ActiveRecord::Base
  self.table_name = '工程マスタ'
  validates :工程コード, presence: true
  validates :工程名, presence: true

end
