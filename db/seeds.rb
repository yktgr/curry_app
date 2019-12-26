# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#

User.create!(name: "user1",
             email: "user1@user.com",
             password: "password",
             password_confirmation: "password",
             )

 User.create!(name: "user2",
              email: "user2@user.com",
              password: "password",
              password_confirmation: "password",
              )
User.create!(name: "user3",
             email: "user3@user.com",
             password: "password",
             password_confirmation: "password",
             )

 User.create!(name: "user4",
              email: "user4@user.com",
              password: "password",
              password_confirmation: "password",
              )

Shop.create(name: "Aカレー",
             address: "千葉県",
             user_id: 1)

Shop.create(name: "Bカレー",
            address: "東京都",
            user_id: 2
)

Shop.create(name: "Cカレー",
            address: "東京都",
            user_id: 2
)
Shop.create(name: "Dカレー",
            address: "東京都",
            user_id: 3
)
Shop.create(name: "Eカレー",
             address: "東京都",
             user_id: 4
)
20.times do |i|
c =  rand(0..4)
s =  rand(5) + 1
u =  rand(1..4)
name = ['チキン','ポーク','ビーフ','フィッシュ','野菜']

r = Recipe.create(
  name: "#{name[c]}カレー",
  content: "この店の人気メニューをコピーしました。",
  curry_type: c,
  shop_id: s,
  user_id: u
)

r.materials.create(
  name: "玉ねぎ",
  amount: "一個",
)

r.materials.create(
  name: "トマト",
  amount: "一個",
)

r.materials.create(
  name: "ターメリック",
  amount: "小さじ半分"
)
r.materials.create(
  name: "コリアンダー",
  amount: "小さじ半分"
)

r.materials.create(
  name: "クミン",
  amount: "小さじ半分"
)

r.flows.create(
  content: "玉ねぎを炒める"
)
r.flows.create(
  content: "#{name[c]}を炒める"
)

r.flows.create(
  content: "スパイスを炒める"
)

r.flows.create(
  content: "１，２を投入し煮込む"
)

r.comments.create(
  content: "test",
  recipe_id: r.id,
  user_id: u
)
end
