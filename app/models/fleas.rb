class Fleas < ActiveHash::Base
  self.data = [
    { id: 0, name: '__' },
    { id: 1, name: '未' },
    { id: 2, name: '済' },
    { id: 3, name: '処置中' }
  ]
end