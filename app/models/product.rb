class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :day
  belongs_to_active_hash :derively_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :status
  has_one_attached :image

  belongs_to :user

  validates :image, :name, :explanation, :category, :derively_fee, :status, :prefecture, :day, :price, presence: { message: "can't be blank" }

  validates :category_id, :day_id, :derively_fee_id, :prefecture_id, :status_id, numericality: { other_than: 0, message: 'select' }

  validates :price, format: { with: /\A[0-9]+\z/, message: 'Price Half-width number' }, inclusion: { in: (300..9_999_999), message: 'Out of setting range' }
end
