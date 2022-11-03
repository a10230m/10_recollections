# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
  Admin.create!(
    email: 'a10230m@gmail.com', password: '000111'
  )


  users = User.create!(
    [
      {email: 'mio@test.com', name: 'mio', password: '111111', birthdate: '1978/12/18', introduction: '趣味は映画・ドラマ鑑賞です。', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")},
      {email: 'yuto@test.com', name: 'yuto', password: '222222', birthdate: '1989/10/20', introduction: '趣味は旅行です。', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")},
      {email: 'araki@test.com', name: 'araki', password: '333333', birthdate: '1991/11/22', introduction: '好きなスポーツはバレーボールです。', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")},
    ]
  )