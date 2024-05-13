# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.find_or_create_by!(email: "cat@example.com") do |user|
  user.name = "cat"
  user.password = "poteto"
  user.is_general = true
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg.png"), filename:"sample-user1.jpg.png")
end

dog = User.find_or_create_by!(email: "dog@example.com") do |user|
  user.name = "dog"
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

User.find_or_create_by!(email: "bear@example.com") do |user|
  user.name = "bear"
  user.password = "poteto"
  user.is_general = true
  user.is_active = true
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4.jpg.png"), filename:"sample-user4.jpg.png")
end

User.find_or_create_by!(email: "panda@example.com") do |user|
  user.name = "panda"
  user.password = "poteto"
  user.is_general = false
  user.is_active = true
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5.jpg.png"), filename:"sample-user5.jpg.png")
  user.introduction = "ご来場をお待ちしております。"
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

Post.find_or_create_by!(name: "辰がいっぱい") do |post|
  post.post_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg")
  post.day = "2024年1月9日〜2024年2月18日"
  post.close_day = "月曜日(2月12日は開館してます)"
  post.hour = "10時〜17時"
  post.place = "カナガワ博物館"
  post.address = "神奈川県横浜市みなとみらい456"
  post.body = "2024年は辰年！辰年にちなんで龍が描かれた作品や彫刻、刀を集めました。たくさんの方のご来場をお待ちしております。"
  post.url = "kanagawa_museum"
  post.user = dog
end

Post.find_or_create_by!(name: "源氏物語の世界") do |post|
  post.post_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg")
  post.day = "2024年5月10日〜2024年6月30日"
  post.close_day = "月曜日"
  post.hour = "10時〜17時"
  post.place = "トウキョウ美術館"
  post.address = "東京都台東区上野123"
  post.body = "1000年の時を超えて愛され続ける『源氏物語』。この物語を作った紫式部と源氏物語絵巻をメインにした企画展です。"
  post.url = "tokyo_museum"
  post.user = meerkat
end


  