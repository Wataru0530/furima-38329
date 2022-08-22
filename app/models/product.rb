class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  has_one_attached :image

  validate :item_name,    presence: true
  validate :info,         presence: true
  validate :category_id,  presence: true
  validate :situation_id, presence: true
  validate :cost_id,      presence: true
  validate :area_id,      presence: true
  validate :day_id,       presence: true
  validate :price,        presence: true
  validate :user,         presence: true

  validate :genre_id, numericality: { other_than: 1 }

end
