class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_id
  belongs_to :situation_id
  belongs_to :cost_id
  belongs_to :area_id
  belongs_to :day_id
  has_one_attached :image

  validates :item_name,    presence: true
  validates :info,         presence: true
  validates :category_id,  presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :situation_id, presence: true
  validates :cost_id,      presence: true
  validates :area_id,      presence: true
  validates :day_id,       presence: true
  validates :price,        presence: true
  validates :user,         presence: true

end
