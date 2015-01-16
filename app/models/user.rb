class User < ActiveRecord::Base
  self.table_name = '担当者マスタ'
  validates :email, confirmation: true
  validates :email, presence: true
  # validates :email_confirmation, presence: true
end