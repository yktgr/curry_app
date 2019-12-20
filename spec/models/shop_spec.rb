require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before  do
    FactoryBot.create(:user)
    FactoryBot.create(:user_second)
    @shop1 = FactoryBot.create(:shop)
    @shop2 = FactoryBot.create(:shop_second)
  end

  it "空があるとバリデーションが通らない" do
    shop = Shop.new(
      name: 'test' ,
      address:'',
      user_id: 1
      )
    expect(shop).not_to be_valid
  end

  it "すべて記載されていればバリデーションが通る" do
    shop = Shop.new(
      name: 'test' ,
      address:'test',
      user_id: 1
      )
    expect(shop).to be_valid
  end
  #
  describe "検索テスト" do
  it "店名" do
    q = Shop.ransack("Aカレー")
    result =  q.result(distinct: true).order(created_at: :desc)
    shops  =  result
   expect(shops).to include @shop1
  end
  end
  end
