# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Admin.find_by(email: 'a10230m@gmail.com').nil?
  Admin.create!(email: 'a10230m@gmail.com', password: '000111', password_confirmation: '000111')
end

users =
  [
    {email: 'mio@test.com', name: 'mio', password: '111111', birthdate: '1978/12/18', introduction: '紅葉が癒し。ストレス発散は甘いもの食べること♪', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")},
    {email: 'yuto@test.com', name: 'yuto', password: '222222', birthdate: '1989/10/20', introduction: '好きな季節は夏。最近のブームは散歩！', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")},
    {email: 'araki@test.com', name: 'araki', password: '333333', birthdate: '1991/11/22', introduction: '趣味はものづくり♪台湾が好き！', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")},
    {email: 'mami@test.com', name: 'mami', password: '444444', birthdate: '1987/03/10', introduction: '沖縄大好き！おしゃれなところを探すのが得意。', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4.jpg"), filename:"sample-user4.jpg")},
    {email: 'tomo@test.com', name: 'tomo', password: '555555', birthdate: '1990/09/15', introduction: '動物が好き。最近ハマっていることはラーメン巡り…', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5.jpg"), filename:"sample-user5.jpg")}
  ].map do |user_attributes|
    user = User.find_by(email: user_attributes[:email])
    if user.nil?
      User.create!(user_attributes)
    end
    user
  end

# userlist
  # mio   = 0
  # yuto  = 1
  # araki = 2
  # mami  = 3
  # tomo  = 4

# photoimage
  [
    # mio
    {photo_title: 'ストロベリーティラミス', photo_caption: 'おいしかった〜', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1-photo1.jpg"), filename:"sample-user1-photo1.jpg"), user_id: users[0].id, created_at: '2020/08/21' },
    {photo_title: 'ゆずサイダー', photo_caption: '', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1-photo2.jpg"), filename:"sample-user1-photo2.jpg"), user_id: users[0].id, created_at: '2019/07/25' },
    {photo_title: '', photo_caption: '', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1-photo3.jpg"), filename:"sample-user1-photo3.jpg"), user_id: users[0].id, created_at: '2022/11/08' },
    # yuto
    {photo_title: 'In 横浜', photo_caption: 'おしゃれなところ♪', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2-photo1.jpg"), filename:"sample-user2-photo1.jpg"), user_id: users[1].id, created_at: '2018/10/12' },
    {photo_title: '梅酒かき氷', photo_caption: 'めちゃくちゃおいしかったからまた食べたい✨', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2-photo2.jpg"), filename:"sample-user2-photo2.jpg"), user_id: users[1].id, created_at: '2019/08/30' },
    {photo_title: '南禅寺水路閣', photo_caption: '手作り体験してきた！', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2-photo3.jpg"), filename:"sample-user2-photo3.jpg"), user_id: users[1].id, created_at: '2019/06/05' },
    {photo_title: '哲学の道', photo_caption: 'たくさん歩いた', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2-photo4.jpg"), filename:"sample-user2-photo4.jpg"), user_id: users[1].id, created_at: '2020/05/19' },
    {photo_title: '伏見稲荷', photo_caption: '上まで登ってつかれたけど、登ってよかった', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2-photo5.jpg"), filename:"sample-user2-photo5.jpg"), user_id: users[1].id, created_at: '2022/11/20' },
    # araki
    {photo_title: 'ピアス', photo_caption: '手作り体験してきた！', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3-photo1.jpg"), filename:"sample-user3-photo1.jpg"), user_id: users[2].id, created_at: '2017/03/20' },
    {photo_title: '陶芸体験', photo_caption: '難しかったけど楽しかった♪', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3-photo3.jpg"), filename:"sample-user3-photo3.jpg"), user_id: users[2].id, created_at: '2019/08/11' },
    # mami
    {photo_title: '軽井沢の朝食', photo_caption: '', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4-photo1.jpg"), filename:"sample-user4-photo1.jpg"), user_id: users[3].id, created_at: '2016/07/12' },
    {photo_title: 'umbrella', photo_caption: '', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4-photo2.jpg"), filename:"sample-user4-photo2.jpg"), user_id: users[3].id, created_at: '2019/02/18' },
    {photo_title: 'ブランコ', photo_caption: '懐かしい', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4-photo3.jpg"), filename:"sample-user4-photo3.jpg"), user_id: users[3].id, created_at: '2020/12/24' },
    {photo_title: 'リース', photo_caption: 'かわいい♪', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4-photo4.jpg"), filename:"sample-user4-photo4.jpg"), user_id: users[3].id, created_at: '2021/01/23' },
    {photo_title: 'ブランチ', photo_caption: '', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4-photo5.jpg"), filename:"sample-user4-photo5.jpg"), user_id: users[3].id, created_at: '2022/06/13' },
    # tomo
    {photo_title: 'ねこ', photo_caption: '寝顔かわいい♡', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5-photo1.jpg"), filename:"sample-user5-photo1.jpg"), user_id: users[4].id, created_at: '2015/12/28' },
    {photo_title: 'わんちゃん', photo_caption: '人懐こかったよ✨', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5-photo2.jpg"), filename:"sample-user5-photo2.jpg"), user_id: users[4].id, created_at: '2017/04/09' },
    {photo_title: 'ねこ2', photo_caption: '腕長い！', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5-photo3.jpg"), filename:"sample-user5-photo3.jpg"), user_id: users[4].id, created_at: '2021/10/05' },
    {photo_title: '煮干しラーメン', photo_caption: 'こってりだけどまた食べたくなる味！', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5-photo4.jpg"), filename:"sample-user5-photo4.jpg"), user_id: users[4].id, created_at: '2021/11/26' },
    {photo_title: '台湾ラーメン', photo_caption: '', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5-photo5.jpg"), filename:"sample-user5-photo5.jpg"), user_id: users[4].id, created_at: '2022/09/06' },
  ].each do |image|
    if PhotoImage.find_by(photo_title: image[:photo_title]).nil?
      PhotoImage.create!(image)
    end
  end


# album
  albums = [
    # mio
    {album_title: '紅葉', album_caption: 'きれいだった✨', user_id: users[0].id, created_at: '2019/11/24'},
    # yuto
    {album_title: '夏の思い出', album_caption: '', user_id: users[1].id, created_at: '2021/08/19'},
    # araki
    {album_title: '京都旅行', album_caption: '友達と京都いってきた♪', user_id: users[2].id, created_at: '2021/10/05'},
    {album_title: '台湾旅行', album_caption: '初台湾！楽しかった♡', user_id: users[2].id, created_at: '2019/09/28'},
    # mami
    {album_title: '沖縄', album_caption: '食べて、飲んで、お祭りもいったよ〜', user_id: users[3].id, created_at: '2018/07/09'},
    # tomo
    {album_title: 'ふくろうカフェ', album_caption: 'いろんな顔があってかわいかった♪', user_id: users[4].id, created_at: '2022/08/17'}
  ].map do |album|
    if Album.find_by(album_title: album[:album_title]).nil?
      album = Album.new(album)
      album.save!(validate: false)
      album
    end
  end

  albums.each do |album|
    #files = album.album_photo_images
    # fixtures/アルバムタイトルと同じフォルダの画像を複数取得
    #files.each do |file|
    path = "#{Rails.root}/db/fixtures/#{album[:album_title]}/"
    Dir.foreach(path) do |image_file_name|
      next if image_file_name == '.' or image_file_name == '..'
      album.album_photo_images.create!({image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/#{album[:album_title]}/#{image_file_name}"), filename: "#{image_file_name}")})
    #end
    end

  end

