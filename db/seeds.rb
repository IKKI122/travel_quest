Admin.create!(
    email: 'admin@admin.com',
    password: 'adminpass'
)

Area.create(id: 1, prefectures: "北海道")
Area.create(id: 2, prefectures: "青森")
Area.create(id: 3, prefectures: "岩手")
Area.create(id: 4, prefectures: "宮城")
Area.create(id: 5, prefectures: "秋田")
Area.create(id: 6, prefectures: "山形")
Area.create(id: 7, prefectures: "福島")
Area.create(id: 8, prefectures: "茨城")
Area.create(id: 9, prefectures: "栃木")
Area.create(id: 10, prefectures: "群馬")
Area.create(id: 11, prefectures: "埼玉")
Area.create(id: 12, prefectures: "千葉")
Area.create(id: 13, prefectures: "東京")
Area.create(id: 14, prefectures: "神奈川")
Area.create(id: 15, prefectures: "新潟")
Area.create(id: 16, prefectures: "富山")
Area.create(id: 17, prefectures: "石川")
Area.create(id: 18, prefectures: "福井")
Area.create(id: 19, prefectures: "山梨")
Area.create(id: 20, prefectures: "長野")
Area.create(id: 21, prefectures: "岐阜")
Area.create(id: 22, prefectures: "静岡")
Area.create(id: 23, prefectures: "愛知")
Area.create(id: 24, prefectures: "三重")
Area.create(id: 25, prefectures: "滋賀")
Area.create(id: 26, prefectures: "京都")
Area.create(id: 27, prefectures: "大阪")
Area.create(id: 28, prefectures: "兵庫")
Area.create(id: 29, prefectures: "奈良")
Area.create(id: 30, prefectures: "和歌山")
Area.create(id: 31, prefectures: "鳥取")
Area.create(id: 32, prefectures: "島根")
Area.create(id: 33, prefectures: "岡山")
Area.create(id: 34, prefectures: "広島")
Area.create(id: 35, prefectures: "山口")
Area.create(id: 36, prefectures: "徳島")
Area.create(id: 37, prefectures: "香川")
Area.create(id: 38, prefectures: "愛媛")
Area.create(id: 39, prefectures: "高知")
Area.create(id: 40, prefectures: "福岡")
Area.create(id: 41, prefectures: "佐賀")
Area.create(id: 42, prefectures: "長崎")
Area.create(id: 43, prefectures: "熊本")
Area.create(id: 44, prefectures: "大分")
Area.create(id: 45, prefectures: "宮崎")
Area.create(id: 46, prefectures: "鹿児島")
Area.create(id: 47, prefectures: "沖縄")

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!(
  [
    {email: 'olivia@test.com', user_name: 'Olivia', encrypted_password: 'password', is_deleted: 'true', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")},
    {email: 'james@test.com', user_name: 'James', encrypted_password: 'password', is_deleted: 'true', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")},
    {email: 'lucas@test.com', user_name: 'Lucas', encrypted_password: 'password', is_deleted: 'true', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")}
  ]
)