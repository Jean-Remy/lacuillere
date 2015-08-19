class Restaurant < ActiveRecord::Base
  has_many :reviews, :dependent => :destroy
  validates :name, presence: true, format: { with: /(\w)+/ }
  validates :address, presence: true, format: { with: /(\w)+/ }
  validates :category, inclusion: { in: %w(chinese italian japanese french belgian) }
  validates :phone_number, presence: true
end
