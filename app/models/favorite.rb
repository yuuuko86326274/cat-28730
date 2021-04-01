class Favorite < ApplicationRecord
  belongs_to :personal
  belongs_to :cat

  validates_uniqueness_of :cat_id, scope: :personal_id  # バリデーション（ユーザーと記事の組み合わせは一意）
end
