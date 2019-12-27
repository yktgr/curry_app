require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before  do
    FactoryBot.create(:user)
    FactoryBot.create(:user_second)
    FactoryBot.create(:shop)
    FactoryBot.create(:shop_second)
  end

  it "空があるとバリデーションが通らない" do
    recipe = Recipe.new(
      name: 'test' ,
      content:'',
      curry_type: 0,
      shop_id: 1
      )
    expect(recipe).not_to be_valid
  end

  it "すべて記載されていればバリデーションが通る" do
    recipe = Recipe.new(
      name: 'test' ,
      content:'test',
      curry_type: 0,
      shop_id: 1)
    expect(recipe).to be_valid
  end

  it "nameが31文字以上あるとバリデーションが通らない" do
    r = "r"*31
    recipe = Recipe.new(
      name: r ,
      content:'test',
      curry_type: 0,
      shop_id: 1
      )
    expect(recipe).not_to be_valid
    end

    it "nameが30文字以下であるとバリデーションが通らない" do
      r = "r"*30
      recipe = Recipe.new(
        name: r ,
        content:'test',
        curry_type: 0,
        shop_id: 1
        )
      expect(recipe).to be_valid
      end

      it "contentが101文字以上あるとバリデーションが通らない" do
        r = "r"*101
        recipe = Recipe.new(
          name: 'test' ,
          content: r,
          curry_type: 0,
          shop_id: 1
          )
        expect(recipe).not_to be_valid
        end

        it "contentが100文字以下であるとバリデーションが通らない" do
          r = "r"*100
          recipe = Recipe.new(
            name: 'test' ,
            content: r,
            curry_type: 0,
            shop_id: 1
            )
          expect(recipe).to be_valid
          end

  describe "検索テスト" do
    before do
      @recipe1 = FactoryBot.create(:recipe)
      @recipe2 = FactoryBot.create(:recipe_second)
    end

  it "curry_type" do
    q = Recipe.ransack("チキンカレー")
    result =  q.result(distinct: true).order(created_at: :desc)
    recipes =  result
   expect(recipes).to include @recipe1
  end
  end
  end
