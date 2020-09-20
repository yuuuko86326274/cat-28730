class Sex < ActiveHash::Base
  self.data = [
    { id: 0, name: '__' },
    { id: 1, name: 'オス' },
    { id: 2, name: 'メス' }
  ]
end
