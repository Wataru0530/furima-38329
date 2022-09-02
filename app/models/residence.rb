class Residence < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :information
  belongs_to :area
end
