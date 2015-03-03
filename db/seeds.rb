Kouteimaster.delete_all
Sagyou.delete_all
Employer.delete_all

Kouteimaster.create!([
  {id:1, 分類:"1", コード:1, 工程名:'販路開拓'},
  {id:2, 分類:"1", コード:2, 工程名:'引合対応'},
  {id:3, 分類:"1", コード:3, 工程名:'見積仕様'},
  {id:4, 分類:"2", コード:1, 工程名:'概要設計'},
  {id:5, 分類:"2", コード:2, 工程名:'詳細設計'},
  {id:6, 分類:"2", コード:3, 工程名:'I/F検討設計'},
  {id:7, 分類:"2", コード:4, 工程名:'移行設計'},
  {id:8, 分類:"2", コード:5, 工程名:'PG設計'},
  {id:9, 分類:"2", コード:6, 工程名:'PG製作'},
  {id:10, 分類:"2", コード:7, 工程名:'テスト仕様'},
  {id:11, 分類:"2", コード:8, 工程名:'システムテスト'},
  {id:12, 分類:"2", コード:9, 工程名:'運用テスト'},
  {id:13, 分類:"2", コード:10, 工程名:'本番立会'},
  ])

Sagyou.create!([
  {id:1, 作業場所コード:1, 作業場所名:'不在'},
  {id:2, 作業場所コード:1, 作業場所名:'本社６Ｆ '},
  {id:3, 作業場所コード:1, 作業場所名:'直行'},
  {id:4, 作業場所コード:1, 作業場所名:'外出'},
  {id:5, 作業場所コード:1, 作業場所名:'出張'},
  {id:6, 作業場所コード:1, 作業場所名:'出張移動'},
  {id:7, 作業場所コード:1, 作業場所名:'会議６Ｆ '},
  {id:8, 作業場所コード:1, 作業場所名:'会議７Ｆ '},
  {id:9, 作業場所コード:1, 作業場所名:'休暇'},
  {id:10, 作業場所コード:1, 作業場所名:'私用外出'},
  {id:11, 作業場所コード:1, 作業場所名:'来客'},
  {id:12, 作業場所コード:1, 作業場所名:'早退'},
  {id:13, 作業場所コード:1, 作業場所名:'特別休暇'},
  {id:14, 作業場所コード:1, 作業場所名:'代休'},
  {id:15, 作業場所コード:1, 作業場所名:'在宅勤務'},
  {id:16, 作業場所コード:1, 作業場所名:'半休'},
  {id:17, 作業場所コード:1, 作業場所名:'サーバ'},
  {id:18, 作業場所コード:1, 作業場所名:'休日'},
  {id:19, 作業場所コード:1, 作業場所名:'相談室'},
  {id:20, 作業場所コード:1, 作業場所名:'フレックス'},
  {id:21, 作業場所コード:1, 作業場所名:'帰宅'},
  {id:22, 作業場所コード:1, 作業場所名:'本社７Ｆ '}
  ])

Employer.create!([
                     {id:1, first_name:'Duc', position: 'IT Engeener', office: 'Osaka', age: 35, start_date: 2015/3/2},
                     {id:2, first_name:'Tuan', position: 'IT Engeener', office: 'Osaka', age: 35, start_date: 2015/3/2},
                     {id:3, first_name:'Quyen', position: 'IT Engeener', office: 'Osaka', age: 35, start_date: 2015/3/2},
                     {id:4, first_name:'Giang', position: 'IT Engeener', office: 'Osaka', age: 35, start_date: 2015/3/2},
                     {id:5, first_name:'Duong', position: 'IT Engeener', office: 'Osaka', age: 35, start_date: 2015/3/2},
                     {id:6, first_name:'Minh', position: 'IT Engeener', office: 'Osaka', age: 35, start_date: 2015/3/2},
                     {id:7, first_name:'Trang', position: 'IT Engeener', office: 'Osaka', age: 35, start_date: 2015/3/2},
                     {id:8, first_name:'Nhung', position: 'IT Engeener', office: 'Osaka', age: 35, start_date: 2015/3/2},
                     {id:9, first_name:'Hung', position: 'IT Engeener', office: 'Osaka', age: 35, start_date: 2015/3/2},
                     {id:10, first_name:'Hai', position: 'IT Engeener', office: 'Osaka', age: 35, start_date: 2015/3/2},
                 ])