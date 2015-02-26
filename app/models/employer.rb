class Employer < ActiveRecord::Base
  self.table_name = 'employer'
  # validates :email, confirmation: true
  validates :first_name, presence: true
  validates :age, presence: true
end