class Employer < ActiveRecord::Base
  self.table_name = 'employer'
  # validates :email, confirmation: true
  # validates :email, presence: true
  # validates :email_confirmation, presence: true
end