require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
      user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000")
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空だと登録できない" do
      user = User.new(nickname: "abe", email: "", password: "00000000", password_confirmation: "00000000")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "パスワードが空だと登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "", password_confirmation: "00000000")
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it "パスワード（確認）がパスワードと一致していないと登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "00000000", password_confirmation: "0000000")
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "名前(名字)が空だと登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", firstname: "")
      user.valid?
      expect(user.errors.full_messages).to include("Firstname can't be blank")
    end
    it "名前が空だと登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", firstname: "a", lastname: "")
      user.valid?
      expect(user.errors.full_messages).to include("Lastname can't be blank")
    end
    it "名前(名字、カナ)が空だと登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", firstname: "a", lastname: "b", firstnamekana: "")
      user.valid?
      expect(user.errors.full_messages).to include("Firstnamekana can't be blank")
    end
    it "名前(カナ)が空だと登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", firstname: "a", lastname: "b", firstnamekana: "ab", lastnamekana: "")
      user.valid?
      expect(user.errors.full_messages).to include("Lastnamekana can't be blank")
    end
    it "生年月日が空だと登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", firstname: "a", lastname: "b", firstnamekana: "ab", lastnamekana: "abc", birth: "")
      user.valid?
      binding.pry
      expect(user.errors.full_messages).to include("Birth can't be blank")
    end
  end
end
