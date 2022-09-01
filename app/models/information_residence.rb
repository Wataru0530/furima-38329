class InformationResidence
  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :code, :area_id, :city, :address,:building, :phone, :token

  with_options presence: true do
    validates :user_id
    validates :product_id
    validates :code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :area_id
    validates :city
    validates :address
    validates :phone, format: { with: /\A\d{10,11}\z/ }
    validates :token
  end

  validates :area_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    information = Information.create(user_id: user_id, producf_id: product_id)
    Residence.create(code: code, area_id: area_id, city: city, address: address, building: building,
                           phone: phone, information_id: information.id)
  end
end