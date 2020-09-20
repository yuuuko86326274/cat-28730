class EyeColor < ActiveHash::Base
  self.data = [
    { id: 0, name: '__' },
    { id: 1, name: 'グリーン' },
    { id: 2, name: 'ブルー' },
    { id: 3, name: 'ヘーゼル' },
    { id: 4, name: 'アンバー' },
    { id: 5, name: 'カッパー' },
    { id: 6, name: 'オッドアイ' },
    { id: 7, name: 'レッド' },
    { id: 8, name: 'その他' }
  ]
end
