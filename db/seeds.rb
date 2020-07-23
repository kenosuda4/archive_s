# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
   name: 'admin',
   email: 'archives@archives.com',
   password: 'archives123',
)

Genre.create!(
   [
      {name: '競泳'},
      {name: 'オープンウォーター'},
      {name: 'トライアスロン'},
   ]
)


AthleticEvent.create!(
   [
      {name: '女子50m自由形'},
      {name: '男子50m自由形'},
      {name: '女子100m自由形'},
      {name: '男子100自由形'},
      {name: '女子200m自由形'},
      {name: '男子200m自由形'},
      {name: '女子400m自由形'},
      {name: '男子400m自由形'},
      {name: '女子800m自由形'},
      {name: '男子800m自由形'},
      {name: '女子1500m自由形'},
      {name: '男子1500m自由形'},
      {name: '女子50mバタフライ'},
      {name: '男子50mバタフライ'},
      {name: '女子100mバタフライ'},
      {name: '男子100mバタフライ'},
      {name: '女子200mバタフライ'},
      {name: '男子200mバタフライ'},
      {name: '女子50m背泳ぎ'},
      {name: '男児50m背泳ぎ'},
      {name: '女子100m背泳ぎ'},
      {name: '男子100m背泳ぎ'},
      {name: '女子200m背泳ぎ'},
      {name: '男子200m背泳ぎ'},
      {name: '女子50m平泳ぎ'},
      {name: '男子50m平泳ぎ'},
      {name: '女子100m平泳ぎ'},
      {name: '男子100m平泳ぎ'},
      {name: '女子200m平泳ぎ'},
      {name: '男子200m平泳ぎ'},
      {name: '女子200m個人メドレー'},
      {name: '男子200m個人メドレー'},
      {name: '女子400m個人メドレー'},
      {name: '男子400m個人メドレー'},
      {name: '女子200mメドレーリレー'},
      {name: '男子200mメドレーリレー'},
      {name: '女子400mメドレーリレー'},
      {name: '男子400mメドレーリレー'},
      {name: '女子200mフリーリレー'},
      {name: '男子200mフリーリレー'},
      {name: '女子400mフリーリレー'},
      {name: '男子400mフリーリレー'},
      {name: '女子800mフリーリレー'},
      {name: '男子800mフリーリレー'},
      {name: '女子その他'},
      {name: '男子その他'},
   ]
)

5.times do |n|
   User.create!(
     email: "test#{n + 1}@test.com",
     name: "テスト太郎#{n + 1}",
     password: "abcdef#{n + 1}",
   )
 end