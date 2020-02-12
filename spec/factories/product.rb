FactoryBot.define do
  factory :product do

    name              {'abe'}
    saler_id          {1}
    description       {'abe'}
    price             {0000}
    prefecture_id     {1}
    categories_id     {1}
    delivery_date_id   {1}
    status_id          {1}
    shopping_charge_id {1}
  end
end