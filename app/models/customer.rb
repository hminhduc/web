class Customer < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 50 }
  has_many :orders, dependent: :destroy
  with_options if: :is_admin? do |admin|
    admin.validates :password, length: { minimum: 10}
    admin.validates :email, presence: true
    admin.validates :email, presence: true
  end
end
