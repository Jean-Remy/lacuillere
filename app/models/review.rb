class Review < ActiveRecord::Base
  belongs_to :restaurant
  validates_presence_of :restaurant
  validates :content, presence: true, format: { with: /(\w)+/ }
  validates :rating, presence: true, numericality: { only_integer: true, less_than: 6, greater_than: -1}
end
