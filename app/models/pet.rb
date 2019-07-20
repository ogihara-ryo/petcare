class Pet < ApplicationRecord
  belongs_to :user
  has_many :physicals, dependent: :destroy
  has_many :meals, dependent: :destroy
  enum sex: { '不明' => 0, 'オス' => 1, 'メス' => 2, '適用不能' => 9 }
end
