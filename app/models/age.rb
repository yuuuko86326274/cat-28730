class Age < ActiveHash::Base
  self.data = [
    { id: 0, name: '__' },
    { id: 1, name: '幼猫 ( 半年未満 )' },
    { id: 2, name: '子猫 ( 半年〜１歳 )' },
    { id: 3, name: '若猫 ( １歳〜３歳 )' },
    { id: 4, name: '成猫 ( ３歳〜１５歳 )' },
    { id: 5, name: '老猫 ( １５歳以上 )' }
  ]
end
