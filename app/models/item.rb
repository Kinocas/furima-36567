class Item < ApplicationRecord
  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id , presence: true
  validates :status_id, presence: true
  validates :fee_burden_id, presence: true
  validates :prefecture_id, presence: true
  validates :day_id, presence: true

  belongs_to :user
  has_one :purchase 

end
