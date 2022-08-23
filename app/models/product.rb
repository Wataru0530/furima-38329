class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_id
  belongs_to :situation_id
  belongs_to :cost_id
  belongs_to :area_id
  belongs_to :day_id
  has_one_attached :image

  with_options presence: true, format: { with: } do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal__to: 9_999_999 },
               presence: { message: "can't be blank" }
  end

  validates :item_name,    presence: true
  validates :info,         presence: true
  validates :category_id,  presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :situation_id, presence: true
  validates :cost_id,      presence: true
  validates :area_id,      presence: true
  validates :day_id,       presence: true
  validates :user,         presence: true
  validates :image,        presence: true

end
