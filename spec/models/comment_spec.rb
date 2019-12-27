require 'rails_helper'

RSpec.describe Comment, type: :model do
  before  do
    FactoryBot.create(:user)
    FactoryBot.create(:shop)
    FactoryBot.create(:recipe)
  end

  it "空があるとバリデーションが通らない" do
    comment = Comment.new(
      content: '',
      user_id: 1
      )
    expect(comment).not_to be_valid
  end

  it "すべて記載されていればバリデーションが通る" do
    comment = Comment.new(
      content: 'test',
      user_id: 1,
      recipe_id: 1
      )
    expect(comment).to be_valid
  end

  it "101文字以上あるとバリデーションが通らない" do
    c = "c"*101
    comment = Comment.new(
      content: c,
      user_id: 1,
      recipe_id: 1
      )
    expect(comment).not_to be_valid
  end

  it "100文字以下であるとバリデーションが通る" do
    c = "c"*100
    comment = Comment.new(
      content: c,
      user_id: 1,
      recipe_id: 1
      )
    expect(comment).to be_valid
  end
  end
