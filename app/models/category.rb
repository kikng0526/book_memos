class Category < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '文芸' },
    { id: 2, name: '実用書' },
    { id: 3, name: 'ビジネス書、経済・経営' },
    { id: 4, name: '絵本、児童書' },
    { id: 5, name: '学習参考書' },
    { id: 6, name: '専門書' },
    { id: 7, name: 'コミック雑誌' },
    { id: 8, name: 'その他' }
  ]
end
