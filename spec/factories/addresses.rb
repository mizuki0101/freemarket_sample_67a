FactoryBot.define do
  factory :address do
    #{classMessage}
    postnumber {"111-2222"}
    prefecture_id {1}
    city {"名古屋市"}
    house_number {123456789}
    send_family_name {"aaaaaaaaaa"}
    send_first_name {"aaaaaaaaaa"}
    send_family_name_kana {"aaaaaaaa"}
    send_first_name_kana {"aaaaaaaaa"}
    user_id {1}
  end
end