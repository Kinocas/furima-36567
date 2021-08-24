class Item < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
  end
  with_options numericality: { other_than: 1 ,message: "を選択してください" } do
    validates :category_id
    validates :status_id
    validates :fee_burden_id
    validates :prefecture_id
    validates :day_id
  end

  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :fee_burden
  belongs_to :prefecture
  belongs_to :day
end
