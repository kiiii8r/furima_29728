class Product < ApplicationRecord
  ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :day, :derively_fee, :prefecture, :status

  validates :name, :explanation, :category, :derively_fee, :status, :prefecture, :day, :price, precence: { message:"can't be blank" }

  validates :category_id, :day_id, :derively_fee_id, :prefecture_id, :status_id, numericality: { other_than: 1, message:"select" }

  validetes :price, format: { with: /\A[0-9]+\z/, message: "Price Half-width number"}

  validates: :content, presence: true, unless: :was_attached?

  def was_attached?
    self.image.was_attached?
  end
end
