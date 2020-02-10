FactoryBot.define do
  factory :user do
    #{classMessage}
    nickname {"aaaaaaaaa"}
    email {"aaa@aaa.aaa"}
    password {"aaaaa1111"}
    password_confirmation {"aaaaa1111"}
    family_name {"aaaaaaaaaa"}
    first_name {"aaaaaaaaaa"}
    family_name_kana {"aaaaaaaa"}
    first_name_kana {"aaaaaaaaa"}
    phonenumber {1111111111}
    birth_year {1999}
    birth_month {10}
    birth_date {24}
  end
end