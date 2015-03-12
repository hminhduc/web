class User < ActiveRecord::Base
  self.table_name = '担当者マスタ'
  # validates :email, confirmation: true
  validates :担当者コード, presence: true
  # validates :email_confirmation, presence: true
end