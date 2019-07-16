class Pet < ApplicationRecord
  belongs_to :user

  enum sex: { '不明' => 0, 'オス' => 1, 'メス' => 2, '適用不能' => 9 }
end
