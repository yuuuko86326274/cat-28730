class PriceRange < ActiveHash::Base
  self.data = [
      {id: 1, name: '¥300〜¥1,000', min: 300, max: 1000},
      {id: 2, name: '¥1,000〜¥5,000', min: 1000, max: 5000},
      {id: 3, name: '¥5,000〜¥10,000', min: 5000, max: 10000},
      {id: 4, name: '¥10,000〜¥30,000', min: 10000, max: 30000},
      {id: 5, name: '¥30,000〜¥50,000', min: 30000, max: 50000},
  ]
end