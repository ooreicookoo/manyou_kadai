FactoryBot.define do
  factory :user do
    name { "管理者" }
    email { "admin@example.jp"}
    password { "password" }
    password_confirmation { "password" }
    admin { "true"}
  end
  factory :second_user, class: User do
    name { "you002" }
    email { "you002@gmail.com" }
    password { "you002"}
    password_confirmation { "you002" }
    admin { "false"}
  end
end
