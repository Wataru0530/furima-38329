class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :cost
  belongs_to :area
  belongs_to :day
  belongs_to :user
  has_one_attached :image
  has_one :edit

  validates :item_name,    presence: true, length: { maximum: 40 }
  validates :info,         presence: true, length: { maximum: 1000 }
  validates :category_id,  numericality: { other_than: 1}
  validates :situation_id, presence: true, numericality: { other_than: 1}
  validates :cost_id,      presence: true, numericality: { other_than: 1}
  validates :area_id,      presence: true, numericality: { other_than: 1}
  validates :day_id,       presence: true, numericality: { other_than: 1}
  validates :price,        presence: true, numericality: { with: /\A[0-9]+\z/, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999}
  validates :image,        presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end
  
end
