require 'rails_helper'

describe User do
  describe "#create" do
    it "Can be registered when all columns exist" do
      user = build(:user)
      expect(user).to be_valid
    end
  end
end

describe User do
  describe "#create" do
      it "is invalid without a nickname " do
        user = build(:user, nickname: nil)
        user.valid?
        expect(user.errors[:nickname]).to include("を入力してください")
    end
  end
end
describe User do
  describe "#create" do
      it "is invalid without a email " do
        user = build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include("を入力してください")
    end
  end
end
describe User do
  describe "#create" do
      it "is invalid without a password " do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include("を入力してください")
    end
  end
end
describe User do
  describe "#create" do
      it "is invalid without a password_confirmation " do
        user = build(:user, password_confirmation: nil)
        user.valid?
        expect(user.errors[:password_confirmation]).to include("を入力してください")
    end
  end
end
describe User do
  describe "#create" do
      it "is invalid without a family_name " do
        user = build(:user, family_name: nil)
        user.valid?
        expect(user.errors[:family_name]).to include("を入力してください")
    end
  end
end
describe User do
  describe "#create" do
      it "is invalid without a first_name " do
        user = build(:user, first_name: nil)
        user.valid?
        expect(user.errors[:first_name]).to include("を入力してください")
    end
  end
end
describe User do
  describe "#create" do
      it "is invalid without a family_name_kana " do
      user = build(:user, family_name_kana: nil)
      user.valid?
      expect(user.errors[:family_name_kana]).to include("を入力してください")
    end
  end
end
describe User do
  describe "#create" do
      it "is invalid without a first_name_kana " do
        user = build(:user, first_name_kana: nil)
        user.valid?
        expect(user.errors[:first_name_kana]).to include("を入力してください")
    end
  end
end
describe User do
  describe "#create" do
      it "is invalid without a phonenumber " do
        user = build(:user, phonenumber: nil)
        user.valid?
        expect(user.errors[:phonenumber]).to include("を入力してください")
    end
  end
end
describe User do
  describe "#create" do
      it "is invalid without a birth_year " do
        user = build(:user, birth_year: nil)
        user.valid?
        expect(user.errors[:birth_year]).to include("を入力してください")
    end
  end
end
describe User do
  describe "#create" do
      it "is invalid without a birth_month " do
        user = build(:user, birth_month: nil)
        user.valid?
        expect(user.errors[:birth_month]).to include("を入力してください")
    end
  end
end
describe User do
  describe "#create" do
      it "is invalid without a birth_date " do
        user = build(:user, birth_date: nil)
        user.valid?
        expect(user.errors[:birth_date]).to include("を入力してください")
    end
  end
end
describe User do
  describe "#create" do
    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end
  end
end
describe User do
  describe "#create" do
    it "is invalid with a nickname that has more than 20 characters" do
      user = build(:user, nickname: "aaaaaaaaaaaaaaaaaaaaa")
      user.valid?
      expect(user.errors[:nickname]).to include("は20文字以内で入力してください")
    end
  end
end
describe User do
  describe "#create" do
    it "is invalid with a password that has more than 128 characters" do
      user = build(:user, password: "1111111111111111111aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      user.valid?
      expect(user.errors[:password]).to include("は128文字以内で入力してください")
    end
  end
end
describe User do
  describe "#create" do
    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")    
    end
  end
end
describe User do
  describe "#create" do
    it "is valid with a nickname that has less than 7 characters " do
      user = build(:user, nickname: "kimura1024")
      expect(user).to be_valid
    end
  end
end
