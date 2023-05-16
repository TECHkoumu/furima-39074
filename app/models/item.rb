class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, default: -> { Category.find_by(id: 1) }
  belongs_to :condition, default: -> { Condition.find_by(id: 1) }
  belongs_to :postage, default: -> { Postage.find_by(id: 1) }
  belongs_to :prefecture, default: -> { Prefecture.find_by(id: 0) }
  belongs_to :preparation_day, default: -> { PreparationDay.find_by(id: 1) }


  validates :image, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :condition_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :postage_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :prefecture_id, presence: true, numericality: { other_than: 0 , message: "can't be blank"} 
  validates :preparation_day_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :price, presence: true, format: { with: /\A\d+\z/ },numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}

end
