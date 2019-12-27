require 'rails_helper'

RSpec.describe Flow, type: :model do
  before  do
    FactoryBot.create(:user)
    FactoryBot.create(:user_second)
    FactoryBot.create(:shop)
    FactoryBot.create(:shop_second)
    FactoryBot.create(:recipe)
  end

  it "空があるとバリデーションが通らない" do
    flow = Flow.new(
      content: '' ,
      recipe_id: 1,
      )
    expect(flow).not_to be_valid
  end

  it "すべて記載されていればバリデーションが通る" do
    flow = Flow.new(
      content: 'test' ,
      recipe_id: 1,
      )
    expect(flow).to be_valid
  end

  it "101文字以上あるとバリデーションが通らない" do
    f = "f"*101
    flow = Flow.new(
      content: f,
      recipe_id: 1,
      )
    expect(flow).not_to be_valid
  end

  it "100文字以下であるとバリデーションが通る" do
    f = "f"*100
    flow = Flow.new(
      content: f,
      recipe_id: 1,
      )
    expect(flow).to be_valid
  end
  
  end
