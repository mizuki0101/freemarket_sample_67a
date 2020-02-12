require 'rails_helper'




describe Address do
  describe "#create" do
    it "Can be registered when all columns exist " do
      user = create(:user)
      address = build(:address,user:user)
      expect(address).to be_valid
    end
  end
end

describe Address do
  describe "#create" do
      it "is invalid without a postnumber " do
        address = build(:address, postnumber: nil)
        address.valid?
        expect( address.errors[:postnumber]).to include("を入力してください")
    end
  end
end

describe Address do
  describe "#create" do
      it "is invalid without a postnumber " do
        address = build(:address, prefecture_id: nil)
        address.valid?
        expect( address.errors[:prefecture_id]).to include("を入力してください")
    end
  end
end

describe Address do
  describe "#create" do
      it "is invalid without a postnumber " do
        address = build(:address, city: nil)
        address.valid?
        expect( address.errors[:city]).to include("を入力してください")
    end
  end
end

describe Address do
  describe "#create" do
      it "is invalid without a postnumber " do
        address = build(:address, house_number: nil)
        address.valid?
        expect( address.errors[:house_number]).to include("を入力してください")
    end
  end
end

describe Address do
  describe "#create" do
      it "is invalid without a postnumber " do
        address = build(:address, send_family_name: nil)
        address.valid?
        expect( address.errors[:send_family_name]).to include("を入力してください")
    end
  end
end

describe Address do
  describe "#create" do
      it "is invalid without a postnumber " do
        address = build(:address, send_first_name: nil)
        address.valid?
        expect( address.errors[:send_first_name]).to include("を入力してください")
    end
  end
end


describe Address do
  describe "#create" do
      it "is invalid without a postnumber " do
        address = build(:address, send_family_name_kana: nil)
        address.valid?
        expect( address.errors[:send_family_name_kana]).to include("を入力してください")
    end
  end
end

describe Address do
  describe "#create" do
      it "is invalid without a postnumber " do
        address = build(:address, send_first_name_kana: nil)
        address.valid?
        expect( address.errors[:send_first_name_kana]).to include("を入力してください")
    end
  end
end

describe Address do
  describe "#create" do
      it "is invalid without a postnumber " do
        address = build(:address, user: nil)
        address.valid?
        expect( address.errors[:user]).to include("を入力してください")
    end
  end
end

RSpec.describe Address, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

