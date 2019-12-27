require 'rails_helper'

RSpec.describe Material, type: :model do
  before  do
    FactoryBot.create(:user)
    FactoryBot.create(:user_second)
    FactoryBot.create(:shop)
    FactoryBot.create(:shop_second)
    FactoryBot.create(:recipe)
  end

  it "空があるとバリデーションが通らない" do
    material = Material.new(
      name: 'test' ,
      amount:'',
      recipe_id: 1,
      )
    expect(material).not_to be_valid
  end

  it "すべて記載されていればバリデーションが通る" do
    material = Material.new(
      name: 'test' ,
      amount:'test',
      recipe_id: 1,
      )
    expect(material).to be_valid
  end

  it "素材名21文字以上あるとバリデーションが通らない" do
    material = Material.new(
      name: 'testtesttesttesttesttest' ,
      amount:'test',
      recipe_id: 1,
      )
    expect(material).not_to be_valid
  end
    it "量11文字以上あるとバリデーションが通らない" do
      material = Material.new(
        name: 'test' ,
        amount:'testtesttest',
        recipe_id: 1,
        )
      expect(material).not_to be_valid
  end
  it "素材名20文字以下であるとバリデーションが通る" do
    material = Material.new(
      name: 'testtesttesttesttest' ,
      amount:'test',
      recipe_id: 1,
      )
    expect(material).to be_valid
  end
    it "量10文字以下であるとバリデーションが通る" do
      material = Material.new(
        name: 'test' ,
        amount:'testtestte',
        recipe_id: 1,
        )
      expect(material).to be_valid
  end
  end
