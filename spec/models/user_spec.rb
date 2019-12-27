require 'rails_helper'

RSpec.describe User, type: :model do
    it "空があるとバリデーションが通らない" do
      user = User.new(
                  name:'user_model',
                  email:'',
                  password:'aaaaaa')
      expect(user).not_to be_valid
    end

    it "すべて記載されていればバリデーションが通る" do
      user = User.new(
                  name:'user_model',
                  email:'user@users.com',
                  password:'aaaaaa')
      expect(user).to be_valid
    end

    it "nameが256文字以上あるとバリデーションが通らない" do
      u = "u"*256
      user = User.new(
                  name: u,
                  email:'user@users.com',
                  password:'aaaaaa')
      expect(user).not_to be_valid
      end

      it "nameが255文字以下であるとバリデーションが通らない" do
        u = "u"*255
        user = User.new(
                    name: u,
                    email:'user@users.com',
                    password:'aaaaaa')
        expect(user).to be_valid
        end

        it "emailが256文字以上あるとバリデーションが通らない" do
          u = "u"*256
          user = User.new(
                      name: "test",
                      email: u &&'@users.com',
                      password:'aaaaaa')
          expect(user).not_to be_valid
          end

          it "emailが255文字以下であるとバリデーションが通る" do
            user = User.new(
                        name: "test",
                        email: 'user@user.com',
                        password:'aaaaaa')
            expect(user).to be_valid
            end
end
