require 'rails_helper'


RSpec.describe Product, type: :model do
  describe Product do
    describe '#create' do
      it 'is invalid without a name ' do
        # user = create(:user)
        # image = create(:image)
        # status = create(:status)
        # product = build(:product, name: "")
        product = build(:product,name:"")
        product.valid?
        expect(product.errors[:name]).to include("can't be blank")
      end
    end
  end
  describe Product do
    describe '#create' do
        it 'is invalid without a saler_id ' do
          # user = create(:user)
          # image = create(:image)
          # status = create(:status)
          product = build(:product, saler_id: nil)
          product.valid?
          expect(product.errors[:saler_id]).to include("can't be blank")
      end
    end
  end
  describe Product do
    describe '#create' do
        it 'is invalid without a description ' do
          # # user = create(:user)
          # image = create(:image)
          # status = create(:status)
          product = build(:product, description: nil)
          product.valid?
          expect(product.errors[:description]).to include("can't be blank")
      end
    end
  end
  describe Product do
    describe '#create' do
        it 'is invalid without a price ' do
          # # user = create(:user)
          # image = create(:image)
          # status = create(:status)
          product = build(:product, price: nil)
          product.valid?
          expect(product.errors[:price]).to include("can't be blank")
      end
    end
  end
  describe Product do
    describe '#create' do
        it 'is invalid without a prefecture_id ' do
          product = build(:product, prefecture_id: nil)
          product.valid?
        # user = create(:user)
        expect(product.errors[:prefecture_id]).to include("can't be blank")
      end
    end
    end
    describe Product do
      describe '#create' do
        it 'is invalid without a categories_id ' do
          product = build(:product, categories_id: nil)
        product.valid?
        # user = create(:user)
        # image = create(:image)
        # status = create(:status)
        expect(product.errors[:categories_id]).to include("can't be blank")
      end
    end
  end
  describe Product do
    describe '#create' do
        it 'is invalid without a delivery_date_id ' do
          product = build(:product, delivery_date_id: nil)
          product.valid?
        # user = create(:user)
        # image = create(:image)
        # status = create(:status)
        expect(product.errors[:delivery_date_id]).to include("can't be blank")
      end
    end
  end
  describe Product do
    describe '#create' do
        it 'is invalid without a status_id ' do
          # # user = create(:user)
          # image = create(:image)
          # status = create(:status)
          product = build(:product, status_id: nil)
          product.valid?
          expect(product.errors[:status_id]).to include("can't be blank")
      end
    end
  end
  describe Product do
    describe '#create' do
        it 'is invalid without a shipping_charges_id ' do
          # # user = create(:user)
          # image = create(:image)
          # status = create(:status)
          product = build(:product, shipping_charges_id: nil)
          product.valid?
          expect(product.errors[:shipping_charges_id]).to include("can't be blank")
      end
    end
  end
end
