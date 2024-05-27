# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


cat = User.find_or_create_by!(email: "cat@example.com") do |user|
  user.name = "cat"
  user.password = "poteto"
  user.is_general = true
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg.png"), filename:"sample-user1.jpg.png")
end

kanagawa = User.find_or_create_by!(email: "dog@example.com") do |user|
  user.name = "kanagawa"
  user.password = "poteto"
  user.is_general = false
  user.is_active = true
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg.png"), filename:"sample-user2.jpg.png")
  user.introduction = "こんにちは！カナガワ博物館です。たくさんの方のご来場をお待ちしております。"
end

meerkat = User.find_or_create_by!(email: "meerkat@example.com") do |user|
  user.name = "meerkat"
  user.password = "poteto"
  user.is_general = true
  user.is_active = true
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg.png"), filename:"sample-user3.jpg.png")
  user.introduction = "月に1度は、展覧会へ行きます。特に江戸後期が好きです！"
end

bear = User.find_or_create_by!(email: "bear@example.com") do |user|
  user.name = "bear"
  user.password = "poteto"
  user.is_general = true
  user.is_active = true
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4.jpg.png"), filename:"sample-user4.jpg.png")
end

panda = User.find_or_create_by!(email: "panda@example.com") do |user|
  user.name = "panda"
  user.password = "poteto"
  user.is_general = true
  user.is_active = true
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5.jpg.png"), filename:"sample-user5.jpg.png")
  user.introduction = "関東近郊の美術館、博物館によく行きます。"
end

capybara = User.find_or_create_by!(email: "capybara@example.com") do |user|
  user.name = "capybara"
  user.password = "poteto"
  user.is_general = true
  user.is_active = true
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user6.jpg"), filename:"sample-user6.jpg")
  user.introduction = "こんにちは！"
end

seal = User.find_or_create_by!(email: "seal@example.com") do |user|
  user.name = "seal"
  user.password = "poteto"
  user.is_general = true
  user.is_active = true
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user7.jpg"), filename:"sample-user7.jpg")
  user.introduction = "刀剣が好きです"
end

wolf = User.find_or_create_by!(email: "wolf@example.com") do |user|
  user.name = "wolf"
  user.password = "poteto"
  user.is_general = true
  user.is_active = true
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user8.jpg"), filename:"sample-user8.jpg")
end

hyena = User.find_or_create_by!(email: "hyena@example.com") do |user|
  user.name = "hyena"
  user.password = "poteto"
  user.is_general = true
  user.is_active = true
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user9.jpg"), filename:"sample-user9.jpg")
end

shibuya = User.find_or_create_by!(email: "shibuya@example.com") do |user|
  user.name = "shibuya"
  user.password = "poteto"
  user.is_general = false
  user.is_active = true
  user.introduction = "しぶや美術館、渋谷区にある私立美術館です。日本の古美術を中心に展覧会で紹介しています。"
end

kyoto = User.find_or_create_by!(email: "kyoto@example.com") do |user|
  user.name = "kyoto"
  user.password = "poteto"
  user.is_general = false
  user.is_active = true
  user.introduction = "キョウト美術館です。主に平安時代から明治時代にかけての京都の文化を中心に収蔵しています。常設展もございます。"
end

maru = User.find_or_create_by!(email: "maru@example.com") do |user|
  user.name = "maru"
  user.password = "poteto"
  user.is_general = false
  user.is_active = true
  user.introduction = "こんにちは！⚪︎⚪︎寺です。京都府にある△△宗の仏教寺です。"
end

saitama = User.find_or_create_by!(email: "saitama@example.com") do |user|
  user.name = "saitama"
  user.password = "poteto"
  user.is_general = false
  user.is_active = true
  user.introduction = "サイタマ博物館です。日本と東洋の文化財を収蔵しており、常設展示もございます。月曜日は休館日しています。"
end

tokyo = User.find_or_create_by!(email: "tokyo@example.com") do |user|
  user.name = "tokyo"
  user.password = "poteto"
  user.is_general = false
  user.is_active = true
  user.introduction = "トウキョウ美術館です。約５０００点の収蔵作品を活かした企画展示を行っております。"
end

Admin.find_or_create_by!(email: 'webcamp@example.com') do |admin|
   admin.password = ENV['SECRET_KEY']
end

Genre.find_or_create_by!(name: '旧石器時代') 

Genre.find_or_create_by!(name: '縄文時代') 

Genre.find_or_create_by!(name: '弥生時代')

Genre.find_or_create_by!(name: '古墳時代')

Genre.find_or_create_by!(name: '飛鳥時代')

Genre.find_or_create_by!(name: '奈良時代')

Genre.find_or_create_by!(name: '平安時代')

Genre.find_or_create_by!(name: '鎌倉時代')

Genre.find_or_create_by!(name: '室町時代')

Genre.find_or_create_by!(name: '安土桃山時代')

Genre.find_or_create_by!(name: '江戸時代')

Genre.find_or_create_by!(name: '明治時代')

Genre.find_or_create_by!(name: '大正時代')

Genre.find_or_create_by!(name: '昭和')

Category.find_or_create_by!(name: '絵画')

Category.find_or_create_by!(name: '書蹟')

Category.find_or_create_by!(name: '彫刻')

Category.find_or_create_by!(name: '金工・武具')

Category.find_or_create_by!(name: '陶磁')

Category.find_or_create_by!(name: '漆工')

Category.find_or_create_by!(name: '木竹')

Category.find_or_create_by!(name: '染織')

Category.find_or_create_by!(name: '考古')

tatsu = Post.find_or_create_by!(name: "辰がいっぱい") do |post|
  post.post_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg")
  post.day = "2024年1月9日〜2024年2月18日"
  post.close_day = "月曜日(2月12日は開館してます)"
  post.hour = "10時〜17時"
  post.place = "カナガワ博物館"
  post.address = "神奈川県横浜市みなとみらい456"
  post.body = "2024年は辰年！辰年にちなんで龍が描かれた作品や彫刻、刀を集めました。たくさんの方のご来場をお待ちしております。"
  post.url = "kanagawa_museum"
  post.user = kanagawa
end

sakura = Post.find_or_create_by!(name: "美術館でお花見") do |post|
  post.post_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/no_image.jpeg"), filename:"no_image.jpeg")
  post.day = "2024年3月1日〜2024年4月14日"
  post.close_day = "月曜日"
  post.hour = "10時〜17時"
  post.place = "ナガノ博物館"
  post.address = "長野県長野市長野876"
  post.body = "博物館でお花見しませんか？をテーマに桜が描かれた作品や春が題材になっている作品を集めた企画展です。"
  post.url = "nagano_museum"
  post.user = panda
end

mono = Post.find_or_create_by!(name: "モノクロ展") do |post|
  post.post_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/no_image.jpeg"), filename:"no_image.jpeg")
  post.day = "2024年4月19日〜2024年5月26日"
  post.close_day = "月曜日"
  post.hour = "10時〜17時"
  post.place = "シズオカ美術館"
  post.address = "静岡県静岡市静岡321"
  post.body = "墨で描かれる絵画には、大きく分けて水墨画と白描画があります。それら絵画作品と書も見られる展示となっています。"
  post.url = "shizuoka_museum"
  post.user = meerkat
end

gengi = Post.find_or_create_by!(name: "源氏物語の世界展") do |post|
  post.post_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg")
  post.day = "2024年5月10日〜2024年6月30日"
  post.close_day = "月曜日"
  post.hour = "10時〜17時"
  post.place = "トウキョウ美術館"
  post.address = "東京都台東区上野123"
  post.body = "1000年の時を超えて愛され続ける『源氏物語』。この物語を作った紫式部と源氏物語絵巻をメインにした企画展です。"
  post.url = "tokyo_museum"
  post.user = tokyo
end

Post.find_or_create_by!(name: "書の世界") do |post|
  post.post_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg")
  post.day = "2024年5月30日〜2024年6月30日"
  post.close_day = "月曜日"
  post.hour = "10時〜17時"
  post.place = "サイタマ博物館"
  post.address = "埼玉県さいたま市さいたま345"
  post.body = "古典作品から現代までの墨で書かれた作品を集めました。文字の美しさ、そこに書かれた想いを感じられる展覧会となっております。"
  post.url = "saitama_museum"
  post.user = saitama
end

Post.find_or_create_by!(name: "若冲展") do |post|
  post.post_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post5.jpg"), filename:"sample-post5.jpg")
  post.day = "2024年7月5日〜2024年8月18日"
  post.close_day = "月曜日(7月15日、8月12日は開館してます)"
  post.hour = "10時〜17時"
  post.place = "キョウト美術館"
  post.address = "京都府京都市京都234"
  post.body = "江戸時代の絵師、伊藤若冲。誕生の地でもある京都で、若冲の作品をメインとした展覧会となっております。"
  post.url = "Kyoto_museum"
  post.user = kyoto
end

Post.find_or_create_by!(name: "⚪︎⚪︎寺と仏像") do |post|
  post.post_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post4.jpg"), filename:"sample-post4.jpg")
  post.day = "2024年7月5日〜2024年9月1日"
  post.close_day = "月曜日(7月12日、8月12日は開館してます)"
  post.hour = "9時〜17時"
  post.place = "⚪︎⚪︎寺"
  post.address = "京都府京都市京都765"
  post.body = "京都にある△△宗のお寺、⚪︎⚪︎寺。5年に1度、特別に公開される⚪︎△像が見られる機会となっております。"
  post.url = "maru_temple"
  post.user = maru
end

Post.find_or_create_by!(name: "江戸の風景") do |post|
  post.post_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post6.jpg"), filename:"sample-post6.jpg")
  post.day = "2024年8月2日〜2024年9月1日"
  post.close_day = "火曜日"
  post.hour = "10時〜17時"
  post.place = "しぶや美術館"
  post.address = "東京都渋谷区渋谷678"
  post.body = "江戸時代、多くの絵師が江戸の町を描きました。今の東京との違いも考えながら、江戸での暮らしを浮世絵から覗いてみませんか？"
  post.url = "shibuya_museum"
  post.user = shibuya
end

Review.find_or_create_by!(title: "新年にぴったり") do |review|
  review.rate = 4.0
  review.day = 1
  review.time = 1
  review.congestion = 1
  review.body = "土曜日の午前中に伺いましたが、会期終盤だったこともあり、館内は混み合っていました。刀剣も見られて満足です。"
  review.user = seal
  review.post = tatsu
end

Review.find_or_create_by!(title: "辰年ならでは！") do |review|
  review.rate = 5.0
  review.day = 1
  review.time = 4
  review.congestion = 0
  review.body = "土曜日に行きましたが、ゆっくり見て回ることができました。"
  review.user = cat
  review.post = tatsu
end

Review.find_or_create_by!(title: "彫刻が見事") do |review|
  review.rate = 4.0
  review.day = 0
  review.time = 1
  review.congestion = 0
  review.body = "襖絵なども見応えあったが、１番気に入った作品は、⚪︎⚪︎作の彫刻。"
  review.user = hyena
  review.post = tatsu
end

Review.find_or_create_by!(title: "美しい") do |review|
  review.rate = 4.0
  review.day = 0
  review.time = 4
  review.congestion = 0
  review.body = "平安時代の雅やかな世界を見事に再現しています。展示された絵巻や資料は、物語の深みをより一層引き立てており、訪れる価値があります。"
  review.user = capybara
  review.post = gengi
end

Review.find_or_create_by!(title: "源氏物語の世界に浸れる") do |review|
  review.rate = 4.0
  review.day = 0
  review.time = 0
  review.congestion = 0
  review.body = "絵巻物や道具箱などの展示もあり、源氏物語関連作品がたくさん見られます。"
  review.user = meerkat
  review.post = gengi
end

Review.find_or_create_by!(title: "絵巻物が素晴らしい") do |review|
  review.rate = 5.0
  review.day = 1
  review.time = 2
  review.congestion = 1
  review.body = "少し混み合っている印象でした。絵巻物中心なので、見るのに列が出来ていましたが、ゆったり見られるタイミングもあり、楽しめました。"
  review.user = bear
  review.post = gengi
end

Review.find_or_create_by!(title: "美しい絵巻物") do |review|
  review.rate = 4.0
  review.day = 0
  review.time = 4
  review.congestion = 0
  review.body = "閉館間際に駆け込みで行ったので、比較的空いており、スムーズに見て回ることが出来ました。"
  review.user = cat
  review.post = gengi
end

Review.find_or_create_by!(title: "平安時代の暮らしも見えてくる") do |review|
  review.rate = 5.0
  review.day = 1
  review.time = 3
  review.congestion = 1
  review.body = "日曜のお昼すぎに訪れました。館内は混んでいる印象はあまりなかったのですが、一部作品の前に列ができていました。絵巻物や着物の展示など物語の深みをより一層引き立てており、その時代の文化や美意識を感じることができます。"
  review.user = wolf
  review.post = gengi
end

Review.find_or_create_by!(title: "雪舟も見られる") do |review|
  review.rate = 5.0
  review.day = 0
  review.time = 2
  review.congestion = 0
  review.body = "平日のお昼頃に訪れ、館内の人はまばらで、ゆっくり見て回れた。前から気になっていた雪舟の作品も近くで見られて満足です。"
  review.user = meerkat
  review.post = mono
end

Review.find_or_create_by!(title: "中も外も桜が綺麗！") do |review|
  review.rate = 5.0
  review.day = 1
  review.time = 3
  review.congestion = 1
  review.body = "日曜日に行ったので、館内は混み合っていました。作品の桜を堪能した後は、美術館の中庭に咲いている桜を眺めながらカフェでお茶もでき幸せな時間でした！"
  review.user = panda
  review.post = sakura
end
