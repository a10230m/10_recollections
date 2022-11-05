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


users =
  [
    {email: 'mio@test.com', name: 'mio', password: '111111', birthdate: '1978/12/18', introduction: '紅葉が癒し。ストレス発散は甘いもの食べること♪', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")},
    {email: 'yuto@test.com', name: 'yuto', password: '222222', birthdate: '1989/10/20', introduction: '好きな季節は夏。最近のブームは散歩！', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")},
    {email: 'araki@test.com', name: 'araki', password: '333333', birthdate: '1991/11/22', introduction: '趣味はものづくり♪台湾が好き！', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")},
    {email: 'mami@test.com', name: 'mami', password: '444444', birthdate: '1987/03/10', introduction: '沖縄大好き！おしゃれなところを探すのが得意。', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4.jpg"), filename:"sample-user4.jpg")},
    {email: 'tomo@test.com', name: 'tomo', password: '555555', birthdate: '1990/09/15', introduction: '動物が好き。最近ハマっていることはラーメン巡り…', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5.jpg"), filename:"sample-user5.jpg")}
  ].map do |user|
    User.find_or_create_by(user)
  end

# photo
  [
    {photo_title: 'ピアス', photo_caption: '手作り体験してきた！', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3-photo1.jpg"), filename:"sample-user3-photo1.jpg"), user_id: users[2].id },
  ].each do |image|
    PhotoImage.find_or_create_by(image)
  end