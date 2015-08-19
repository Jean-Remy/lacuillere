class Restaurant < ActiveRecord::Base
  CATEGORIES = %w(chinese italian japanese french belgian)
  has_many :reviews, :dependent => :destroy
  validates :name, presence: true, format: { with: /(\w)+/ }
  validates :address, presence: true, format: { with: /(\w)+/ }
  validates :category, inclusion: { in: CATEGORIES }
  validates :phone_number, presence: true
end
