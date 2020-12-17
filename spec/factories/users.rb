FactoryBot.define do
  factory :user do
    name { "管理者"}
    emai { "admin@example.jp"}
    password { "password"}
    password_confirmation { "password"}
    admin { "true"}
  end
  factory :second_user, class: User do
    name { "ReikoEnomoto"}
    emai { "reiko@gmail.com"}
    password { "123456"}
    password_confirmation { "123456"}
    admin { "false"}
  end
end
