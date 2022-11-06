# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Admin.find_by(email: 'admin@test.com').nil?
  Admin.create!(email: 'admin@test.com', password: '000111', password_confirmation: '000111')
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
      user = User.create!(user_attributes)
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
   photo_images =
  [
    # mio
    {photo_title: 'ストロベリーティラミス', photo_caption: 'おいしかった〜', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1-photo1.jpg"), filename:"sample-user1-photo1.jpg"), user_id: users[0].id, created_at: '2020/08/21 10:33' },
    {photo_title: 'ゆずサイダー', photo_caption: '', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1-photo2.jpg"), filename:"sample-user1-photo2.jpg"), user_id: users[0].id, created_at: '2019/07/25 09:17' },
    {photo_title: '', photo_caption: '', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1-photo3.jpg"), filename:"sample-user1-photo3.jpg"), user_id: users[0].id, created_at: '2022/11/08 11:22' },
    # yuto
    {photo_title: 'In 横浜', photo_caption: 'おしゃれなところ♪', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2-photo1.jpg"), filename:"sample-user2-photo1.jpg"), user_id: users[1].id, created_at: '2018/10/12 12:58'},
    {photo_title: '梅酒かき氷', photo_caption: 'めちゃくちゃおいしかったからまた食べたい✨', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2-photo2.jpg"), filename:"sample-user2-photo2.jpg"), user_id: users[1].id, created_at: '2019/08/30 08:42'},
    {photo_title: '南禅寺水路閣', photo_caption: '手作り体験してきた！', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2-photo3.jpg"), filename:"sample-user2-photo3.jpg"), user_id: users[1].id, created_at: '2019/06/05 06:25'},
    {photo_title: '哲学の道', photo_caption: 'たくさん歩いた', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2-photo4.jpg"), filename:"sample-user2-photo4.jpg"), user_id: users[1].id, created_at: '2020/05/19'},
    {photo_title: '伏見稲荷', photo_caption: '上まで登ってつかれたけど、登ってよかった', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2-photo5.jpg"), filename:"sample-user2-photo5.jpg"), user_id: users[1].id, created_at: '2022/11/20 07:50'},
    # araki
    {photo_title: 'ピアス', photo_caption: '手作り体験してきた！', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3-photo1.jpg"), filename:"sample-user3-photo1.jpg"), user_id: users[2].id, created_at: '2017/03/20 10:29'},
    {photo_title: '陶芸体験', photo_caption: '難しかったけど楽しかった♪', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3-photo3.jpg"), filename:"sample-user3-photo3.jpg"), user_id: users[2].id, created_at: '2019/08/11 09:41'},
    # mami
    {photo_title: '軽井沢の朝食', photo_caption: '', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4-photo1.jpg"), filename:"sample-user4-photo1.jpg"), user_id: users[3].id, created_at: '2016/07/12 08:40'},
    {photo_title: 'umbrella', photo_caption: '', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4-photo2.jpg"), filename:"sample-user4-photo2.jpg"), user_id: users[3].id, created_at: '2019/02/18 14:10'},
    {photo_title: 'ブランコ', photo_caption: '懐かしい', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4-photo3.jpg"), filename:"sample-user4-photo3.jpg"), user_id: users[3].id, created_at: '2020/12/24 22:11'},
    {photo_title: 'リース', photo_caption: 'かわいい♪', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4-photo4.jpg"), filename:"sample-user4-photo4.jpg"), user_id: users[3].id, created_at: '2021/01/23 11:38'},
    {photo_title: 'ブランチ', photo_caption: '', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4-photo5.jpg"), filename:"sample-user4-photo5.jpg"), user_id: users[3].id, created_at: '2022/06/13 05:19'},
    # tomo
    {photo_title: 'ねこ', photo_caption: '寝顔かわいい♡', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5-photo1.jpg"), filename:"sample-user5-photo1.jpg"), user_id: users[4].id, created_at: '2015/12/28 10:48'},
    {photo_title: 'わんちゃん', photo_caption: '人懐こかったよ✨', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5-photo2.jpg"), filename:"sample-user5-photo2.jpg"), user_id: users[4].id, created_at: '2017/04/09 11:08'},
    {photo_title: 'ねこ2', photo_caption: '腕長い！', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5-photo3.jpg"), filename:"sample-user5-photo3.jpg"), user_id: users[4].id, created_at: '2021/10/05 09:05'},
    {photo_title: '煮干しラーメン', photo_caption: 'こってりだけどまた食べたくなる味！', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5-photo4.jpg"), filename:"sample-user5-photo4.jpg"), user_id: users[4].id, created_at: '2021/11/26 12:07'},
    {photo_title: '台湾ラーメン', photo_caption: '', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5-photo5.jpg"), filename:"sample-user5-photo5.jpg"), user_id: users[4].id, created_at: '2022/09/06 10:02'},
  ].map do |image|
    photo_image = PhotoImage.find_by(photo_title: image[:photo_title])
    if photo_image.nil?
      photo_image = PhotoImage.create!(image)
    end
    photo_image
  end


# album
  albums = [
    # mio
    {album_title: '紅葉', album_caption: 'きれいだった✨', user_id: users[0].id, created_at: '2019/11/24 09:33'},
    # yuto
    {album_title: '夏の思い出', album_caption: '', user_id: users[1].id, created_at: '2021/08/19 10:08'},
    # araki
    {album_title: '京都旅行', album_caption: '友達と京都いってきた♪', user_id: users[2].id, created_at: '2021/10/05 08:50'},
    {album_title: '台湾旅行', album_caption: '初台湾！楽しかった♡', user_id: users[2].id, created_at: '2019/09/28 11:30'},
    # mami
    {album_title: '沖縄', album_caption: '食べて、飲んで、お祭りもいったよ〜', user_id: users[3].id, created_at: '2018/07/09 08:10'},
    # tomo
    {album_title: 'ふくろうカフェ', album_caption: 'いろんな顔があってかわいかった♪', user_id: users[4].id, created_at: '2022/08/17 12:45'}
  ].map do |album|
    if Album.find_by(album_title: album[:album_title]).nil?
      album = Album.new(album)
      album.save!(validate: false)
      album
    end
  end

  albums.each do |album|
    # fixtures/アルバムタイトルと同じフォルダの画像を複数取得
    path = "#{Rails.root}/db/fixtures/#{album[:album_title]}/"
    Dir.foreach(path) do |image_file_name|
      next if image_file_name == '.' or image_file_name == '..'
      album.album_photo_images.create!({image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/#{album[:album_title]}/#{image_file_name}"), filename: "#{image_file_name}")})
    #end
    end
  end

  # photoのfav
  # tomoのみfavなし
  Favorite.create!(
    [
      {photo_image_id: photo_images[0].id, user_id: 1},
      {photo_image_id: 19, user_id: 1},
      {photo_image_id: 17, user_id: 1},
      {photo_image_id: 16, user_id: 2},
      {photo_image_id: 18, user_id: 2},
      {photo_image_id: 1, user_id: 3},
      {photo_image_id: 11, user_id: 3},
      {photo_image_id: 2, user_id: 4}
    ]
  )

  # albumのfav
  # mioのみfavなし
  AlbumFavorite.create!(
    [
      {album_id: 3, user_id: 2},
      {album_id: 4, user_id: 2},
      {album_id: 6, user_id: 3},
      {album_id: 1, user_id: 4},
      {album_id: 2, user_id: 5},
      {album_id: 4, user_id: 5},
      {album_id: 5, user_id: 5},
      {album_id: 3, user_id: 5}
    ]
  )


 # albumphotoimageのfav
  # yutoのみfavなし
  AlbumPhotoImageFavorite.create!(
    [
      {album_photo_image_id: 18, user_id: 1},
      {album_photo_image_id: 29, user_id: 1},
      {album_photo_image_id: 1, user_id: 3},
      {album_photo_image_id: 30, user_id: 3},
      {album_photo_image_id: 18, user_id: 4},
      {album_photo_image_id: 13, user_id: 4},
      {album_photo_image_id: 16, user_id: 4},
      {album_photo_image_id: 25, user_id: 5}
    ]
  )




  # comment
  # arakiのみコメントなし
  PhotoComment.create!(
    [
      {photo_image_id: 18, user_id: 1, comment: 'かわいい♡', created_at: '2021/10/05 19:31'},

      {photo_image_id: 5, user_id: 1, comment: '私も食べてみたいな！', created_at: '2019/08/31 12:15'},
      {photo_image_id: 5, user_id: 2, comment: '本当においしいからぜひ！', created_at: '2019/08/31 12:50'},

      {photo_image_id: 4, user_id: 1, comment: 'おしゃれ♪', created_at: '2018/10/12 22:22'},

      {photo_image_id: 14, user_id: 1, comment: 'このリースかわいいね♪', created_at: '2021/01/24 10:08'},

      {photo_image_id: 13, user_id: 2, comment: 'なつかしいね！最近みかけないかも…', created_at: '2020/12/25 09:45'},
      {photo_image_id: 13, user_id: 4, comment: '近くに公園ないから懐かしくてとっちゃった笑', created_at: '2020/12/25 12:11'},

      {photo_image_id: 12, user_id: 2, comment: 'こんなところあるんだ✨', created_at: '2019/02/18 14:58'},
      {photo_image_id: 12, user_id: 4, comment: '軽井沢だよ♪', created_at: '2019/02/18 15:20'},

      {photo_image_id: 17, user_id: 4, comment: 'すごいかわいい！人懐こいとよりかわいいね♪', created_at: '2017/04/10 07:30'},

      {photo_image_id: 10, user_id: 4, comment: 'つくるの上手くない？！', created_at: '2019/08/11 23:04'},
      {photo_image_id: 10, user_id: 3, comment: '先生に直されたのよ笑', created_at: '2019/08/11 23:48'},

      {photo_image_id: 11, user_id: 5, comment: '豪華すぎる！', created_at: '2016/07/12 17:55'},
      {photo_image_id: 11, user_id: 4, comment: '貴重な朝食すぎてたべるのもったいなかった笑', created_at: '2016/07/12 19:35'}
      ]
  )




  # good
  # mioなし
  Good.create!(
    [
      {photo_image_id: 18, user_id: 5, photo_comment_id: 1},

      # 2つ目のコメントにgood
      {photo_image_id: 5, user_id: 1, photo_comment_id: 3},

      {photo_image_id: 4, user_id: 2, photo_comment_id: 4},

      {photo_image_id: 14, user_id: 4, photo_comment_id: 5},

      # 2つ目のコメントにgood
      {photo_image_id: 13, user_id: 2, photo_comment_id: 7},

      # 2つ目のコメントにgood
      {photo_image_id: 12, user_id: 2,  photo_comment_id: 9},

      {photo_image_id: 17, user_id: 5, photo_comment_id: 10},

      # 2つ目のコメントにgood
      {photo_image_id: 10, user_id: 4, photo_comment_id: 12},

      # 2つ目のコメントにgood
      {photo_image_id: 11, user_id: 5,  photo_comment_id: 14}
    ]
  )



  # albumphotocomment
  # mamiのみコメントなし
  album_photo_image = AlbumPhotoImage.all
  album_photo_comments = [
      {album_photo_image_id: 41, user_id: 1, comment: '目くりくり！', created_at: '2022/08/17 23:31'},
      {album_photo_image_id: 41, user_id: 5, comment: 'かわいいよね！いろんな種類がいてたのしかったよ✨', created_at: '2022/08/17 23:40'},

      {album_photo_image_id: 36, user_id: 1, comment: 'シンプルで素敵♪', created_at: '2018/07/09 12:15'},

      {album_photo_image_id: 28, user_id: 2, comment: 'ここ有名だよね！一度はいってみたいな。', created_at: '2019/09/29 20:22'},

      {album_photo_image_id: 3, user_id: 2, comment: '紅葉きれいだね♪', created_at: '2019/11/24 19:08'},
      {album_photo_image_id: 3, user_id: 1, comment: 'すごいきれいだったよー！', created_at: '2019/11/24 19:22'},

      {album_photo_image_id: 21, user_id: 2, comment: '湯葉おいしそう！なかなか食べる機会ないな〜', created_at: '2021/10/05 23:50'},
      {album_photo_image_id: 21, user_id: 3, comment: 'ぜひ食べにいってみて✨', created_at: '2021/10/06 09:10'},

      {album_photo_image_id: 32, user_id: 3, comment: 'またよしさんのところいってきたのね♡', created_at: '2018/07/09 23:58'},
      {album_photo_image_id: 32, user_id: 4, comment: 'ついにいってきた！念願の♡', created_at: '2018/07/10 00：23'},

      {album_photo_image_id: 8, user_id: 3, comment: 'ここいったことある！お茶できるよね♪', created_at: '2021/08/19 20:30'},

      {album_photo_image_id: 24, user_id: 5, comment: '本場小籠包おいしかった？✨', created_at: '2019/09/28 23:06'},
      {album_photo_image_id: 24, user_id: 3, comment: 'おいしかった！！いっぱいたべたよ♪', created_at: '2019/09/28 23:33'},

      {album_photo_image_id: 30, user_id: 5, comment: '沖縄そばたべたい！', created_at: '2018/07/09 17:55'}
      ].map.each do |album_photo_comment_params|
        album_photo_comment = AlbumPhotoComment.find_by(album_photo_image_id: album_photo_comment_params[:album_photo_image_id], user_id: album_photo_comment_params[:user_id])
        if album_photo_comment.nil?
          album_photo_comment = AlbumPhotoComment.create!(album_photo_comment_params)
        end
        album_photo_comment
        end



  # good
  # yutoなし
  AlbumPhotoGood.create!(
    [
      # 2つ目のコメントにgood
      {album_photo_image_id: 41, user_id: 1, album_photo_comment_id: 2},

      {album_photo_image_id: 36, user_id: 4, album_photo_comment_id: 3},

      {album_photo_image_id: 28, user_id: 3, album_photo_comment_id: 4},

      # 2つ目のコメントにgood
      {album_photo_image_id: 3, user_id: 2, album_photo_comment_id: 6},

      # 2つ目のコメントにgood
      {album_photo_image_id: 21, user_id: 2, album_photo_comment_id: 8},

      # 2つ目のコメントにgood
      {album_photo_image_id: 32, user_id: 3,  album_photo_comment_id: 10},

      {album_photo_image_id: 8, user_id: 2,  album_photo_comment_id: 11},

      # 2つ目のコメントにgood
      {album_photo_image_id: 24, user_id: 5,  album_photo_comment_id: 13},

      {album_photo_image_id: 30, user_id: 4,  album_photo_comment_id: 14}
    ]
  )




  Notification.create!(
    [
      # photo
      {visiter_id: 1, visited_id: 5, photo_comment_id: 1, photo_image_id: 18, action: "photo_comment", checked: false, created_at: '2021/10/05 19:31'},
      {visiter_id: 5, visited_id: 1, photo_comment_id: 1, photo_image_id: 18, action: "good", checked: false, created_at: '2021/10/05 19:39'},

      {visiter_id: 1, visited_id: 2, photo_comment_id: 2, photo_image_id: 5, action: "photo_comment", checked: false, created_at: '2019/08/31 12:15'},
      {visiter_id: 2, visited_id: 1, photo_comment_id: 3, photo_image_id: 5, action: "photo_comment", checked: false, created_at: '2019/08/31 12:50'},
      {visiter_id: 1, visited_id: 2, photo_comment_id: 3, photo_image_id: 5, action: "good", checked: false, created_at: '2019/08/31 12:55'},

      {visiter_id: 1, visited_id: 2, photo_comment_id: 4, photo_image_id: 4, action: "photo_comment", checked: false, created_at: '2018/10/12 22:22'},
      {visiter_id: 2, visited_id: 1, photo_comment_id: 4, photo_image_id: 4, action: "good", checked: false, created_at: '2018/10/12 22:33'},

      {visiter_id: 1, visited_id: 4, photo_comment_id: 5, photo_image_id: 14, action: "photo_comment", checked: false, created_at: '2021/01/24 10:08'},
      {visiter_id: 4, visited_id: 1, photo_comment_id: 5, photo_image_id: 14, action: "good", checked: false, created_at: '2021/01/24 10:44'},

      {visiter_id: 2, visited_id: 4, photo_comment_id: 6, photo_image_id: 13, action: "photo_comment", checked: false, created_at: '2020/12/25 09:45'},
      {visiter_id: 4, visited_id: 2, photo_comment_id: 7, photo_image_id: 13, action: "photo_comment", checked: false, created_at: '2020/12/25 12:11'},
      {visiter_id: 2, visited_id: 4, photo_comment_id: 7, photo_image_id: 13, action: "good", checked: false, created_at: '2020/12/25 12:20'},

      {visiter_id: 2, visited_id: 4, photo_comment_id: 8, photo_image_id: 12, action: "photo_comment", checked: false, created_at: '2019/02/18 14:58'},
      {visiter_id: 4, visited_id: 2, photo_comment_id: 9, photo_image_id: 12, action: "photo_comment", checked: false, created_at: '2019/02/18 15:20'},
      {visiter_id: 2, visited_id: 4, photo_comment_id: 9, photo_image_id: 12, action: "good", checked: false, created_at: '2019/02/18 15:30'},

      {visiter_id: 4, visited_id: 5, photo_comment_id: 10, photo_image_id: 17, action: "photo_comment", checked: false, created_at: '2017/04/10 07:30'},
      {visiter_id: 5, visited_id: 4, photo_comment_id: 10, photo_image_id: 17, action: "good", checked: false, created_at: '2017/04/10 10:02'},

      {visiter_id: 4, visited_id: 3, photo_comment_id: 11, photo_image_id: 10, action: "photo_comment", checked: false, created_at: '2019/08/11 23:04'},
      {visiter_id: 3, visited_id: 4, photo_comment_id: 12, photo_image_id: 10, action: "photo_comment", checked: false, created_at: '2019/08/11 23:48'},
      {visiter_id: 4, visited_id: 3, photo_comment_id: 12, photo_image_id: 10, action: "good", checked: false, created_at: '2019/08/11 23:56'},

      {visiter_id: 5, visited_id: 4, photo_comment_id: 11, photo_image_id: 11, action: "photo_comment", checked: false, created_at: '2016/07/12 17:55'},
      {visiter_id: 4, visited_id: 5, photo_comment_id: 12, photo_image_id: 11, action: "photo_comment", checked: false, created_at: '2016/07/12 19:35'},
      {visiter_id: 5, visited_id: 4, photo_comment_id: 12, photo_image_id: 11, action: "good", checked: false, created_at: '2016/07/12 19:59'},

      # album
      {visiter_id: 1, visited_id: 5, album_photo_comment_id: 1, album_photo_image_id: 41, action: "album_photo_comment", checked: false, created_at: '2022/08/17 23:31'},
      {visiter_id: 5, visited_id: 1, album_photo_comment_id: 2, album_photo_image_id: 41, action: "album_photo_comment", checked: false, created_at: '2022/08/17 23:40'},
      {visiter_id: 1, visited_id: 5, album_photo_comment_id: 2, album_photo_image_id: 41, action: "album_photo_good", checked: false, created_at: '2022/08/17 23:45'},

      {visiter_id: 1, visited_id: 4, album_photo_comment_id: 3, album_photo_image_id: 36, action: "album_photo_comment", checked: false, created_at: '2018/07/09 12:15'},
      {visiter_id: 4, visited_id: 1, album_photo_comment_id: 3, album_photo_image_id: 36, action: "album_photo_good", checked: false, created_at: '2018/07/09 12:19'},

      {visiter_id: 2, visited_id: 3, album_photo_comment_id: 4, album_photo_image_id: 28, action: "album_photo_comment", checked: false, created_at: '2019/09/29 20:22'},
      {visiter_id: 3, visited_id: 2, album_photo_comment_id: 4, album_photo_image_id: 28, action: "album_photo_good", checked: false, created_at: '2019/09/29 20:30'},

      {visiter_id: 2, visited_id: 1, album_photo_comment_id: 5, album_photo_image_id: 3, action: "album_photo_comment", checked: false, created_at: '2019/11/24 19:08'},
      {visiter_id: 1, visited_id: 2, album_photo_comment_id: 6, album_photo_image_id: 3, action: "album_photo_comment", checked: false, created_at: '2019/11/24 19:22'},
      {visiter_id: 2, visited_id: 1, album_photo_comment_id: 6, album_photo_image_id: 3, action: "album_photo_good", checked: false, created_at: '2019/11/24 19:30'},

      {visiter_id: 2, visited_id: 3, album_photo_comment_id: 7, album_photo_image_id: 21, action: "album_photo_comment", checked: false, created_at: '2021/10/05 23:50'},
      {visiter_id: 3, visited_id: 2, album_photo_comment_id: 8, album_photo_image_id: 21, action: "album_photo_comment", checked: false, created_at: '2021/10/06 09:10'},
      {visiter_id: 2, visited_id: 3, album_photo_comment_id: 8, album_photo_image_id: 21, action: "album_photo_good", checked: false, created_at: '2021/10/06 09:11'},

      {visiter_id: 3, visited_id: 4, album_photo_comment_id: 9, album_photo_image_id: 32, action: "album_photo_comment", checked: false, created_at: '2018/07/09 23:58'},
      {visiter_id: 4, visited_id: 3, album_photo_comment_id: 10, album_photo_image_id: 32, action: "album_photo_comment", checked: false, created_at: '2018/07/10 00：23'},
      {visiter_id: 3, visited_id: 4, album_photo_comment_id: 10, album_photo_image_id: 32, action: "album_photo_good", checked: false, created_at: '2018/07/10 00：30'},

      {visiter_id: 3, visited_id: 2, album_photo_comment_id: 11, album_photo_image_id: 8, action: "album_photo_comment", checked: false, created_at: '2021/08/19 20:30'},
      {visiter_id: 2, visited_id: 3, album_photo_comment_id: 11, album_photo_image_id: 8, action: "album_photo_good", checked: false, created_at: '2021/08/19 20:45'},

      {visiter_id: 5, visited_id: 3, album_photo_comment_id: 12, album_photo_image_id: 24, action: "album_photo_comment", checked: false, created_at: '2019/09/28 23:06'},
      {visiter_id: 3, visited_id: 5, album_photo_comment_id: 13, album_photo_image_id: 24, action: "album_photo_comment", checked: false, created_at: '2019/09/28 23:33'},
      {visiter_id: 5, visited_id: 3, album_photo_comment_id: 13, album_photo_image_id: 24, action: "album_photo_good", checked: false, created_at: '2019/09/28 23:50'},

      {visiter_id: 5, visited_id: 4, album_photo_comment_id: 14, album_photo_image_id: 30, action: "album_photo_comment", checked: false, created_at: '2018/07/09 17:55'},
      {visiter_id: 4, visited_id: 5, album_photo_comment_id: 14, album_photo_image_id: 30, action: "album_photo_good", checked: false, created_at: '2018/07/09 18:00'}
    ]
  )