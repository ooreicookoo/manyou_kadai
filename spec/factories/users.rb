FactoryBot.define do
  factory :user do
    name { "管理者"}
    emai { "admin@example.jp"}
    password { "password"}
    password_confirmation { "password"}
    admin { "true"}
  end
  factory :second_user do, class: User do
    name { "TesutoTesto"}
    emai { "tesuto@test.com"}
    password { "123456"}
    password_confirmation { "123456"}
    admin { "false"}
end
