class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  attr_accessor :token

  belongs_to :purchase

  validates :price, presence: true
  validates :token, presence: true
end
