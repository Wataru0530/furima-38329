class Information < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_one    :residence
end
