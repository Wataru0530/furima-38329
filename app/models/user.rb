class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,       presence: true
  validates :firstname,      presence: true
  validates :lastname,       presence: true
  validates :firstnamekana,  presence: true
  validates :lastnamekana,   presence: true
  
  has_many :products,        dependent: :destroy
  has_many :purchases,       dependent: :destroy

end
