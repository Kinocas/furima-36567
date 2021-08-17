class Item < ApplicationRecord
  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id , numericality: { other_than: 1 , message: "can't be blank"} 
  validates :status_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :fee_burden_id, presence: true
  validates :prefecture_id, presence: true
  validates :day_id, presence: true

  belongs_to :user
  has_one :purchase 
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :Status

end
