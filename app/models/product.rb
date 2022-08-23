class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_id
  belongs_to :situation_id
  belongs_to :cost_id
  belongs_to :area_id
  belongs_to :day_id
  has_one_attached :image
  belongs_to :user

  validates :item_name,    presence: true, length: { maximum: 40 }
  validates :info,         presence: true, length: { maximum: 1000 }
  validates :category_id,  presence: true, numericality: { other_than: 1}
  validates :situation_id, presence: true, numericality: { other_than: 1}
  validates :cost_id,      presence: true, numericality: { other_than: 1}
  validates :area_id,      presence: true, numericality: { other_than: 1}
  validates :day_id,       presence: true, numericality: { other_than: 1}
  validates :price,        presence: true, numericality: { with: /\A[0-9]+\z/}
  validates :price,        presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999}
  validates :image,        presence: true

end
