class Character < ActiveHash::Base
  self.data = [
    { id: 0, name: '__' },
    { id: 1, name: '活動的' },
    { id: 2, name: '穏やか' },
    { id: 3, name: '甘えん坊' },
    { id: 4, name: 'ツンデレ' },
    { id: 5, name: 'ワイルド' },
    { id: 6, name: '怖がり' },
    { id: 7, name: '好奇心旺盛' }
  ]
end
