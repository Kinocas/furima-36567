class Item < ApplicationRecord
  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id , numericality: { other_than: 1 , message: "can't be blank"} 
  validates :status_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :fee_burden_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :day_id, numericality: { other_than: 1 , message: "can't be blank"}

  belongs_to :user
  has_one :purchase 
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :fee_burden
  belongs_to :prefecture
  belongs_to :day

end