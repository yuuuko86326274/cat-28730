class HowMany < ActiveHash::Base
  self.data = [
    { id: 0, name: '__' },
    { id: 1, name: '一頭飼育' },
    { id: 2, name: '多頭飼育' }
  ]
end
