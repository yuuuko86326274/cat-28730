class HairLength < ActiveHash::Base
  self.data = [
    { id: 0, name: '__' },
    { id: 1, name: '長毛' },
    { id: 2, name: '短毛' },
    { id: 3, name: 'その他' }
  ]
end
